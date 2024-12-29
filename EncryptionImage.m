clc;
close all;
clear all;

ASCII_Code = imread('Image.jpg');
xxx = max(ASCII_Code(:));
yyy = 0;

if xxx >= 256
    B = xxx + 1;
else
    B = 256 + 1;
end

figure(1);
imshow(ASCII_Code);

Key = input('\nSet the Key: ', 's');
Key_Code = Key - 0;

%% Encryption
for i = 1:B
    for j = 1:B
        if mod(i + j - 1, B) == 0
            V(i, j) = B;
        else
            V(i, j) = mod(i + j - 1, B);
        end
    end
end

[r, c] = size(ASCII_Code);
rc = r * c;

for i = 1:rc
    if mod(i, length(Key_Code)) == 0
        k(i) = Key_Code(length(Key_Code));
    else
        k(i) = Key_Code(mod(i, length(Key_Code)));
    end
end

numRows = ceil(length(k) / c);
p = numRows * c - length(k); % Padding
k = [k, zeros(1, p)];        % Pad with zeros
kk = reshape(k, c, []).';    % Reshape into matrix with c columns

for ii = 1:r
    for jj = 1:c
        C(ii, jj) = V((kk(ii, jj) - yyy + 1), (ASCII_Code(ii, jj) - yyy + 1));
    end
end

Encrypted_Code = C - 1;
figure(2);
imshow(Encrypted_Code);

%% Decryption
Key2 = input('\nGive the Password: ', 's');
Key_Code_2 = Key2 - 0;

for i = 1:rc
    if mod(i, length(Key_Code_2)) == 0
        k2(i) = Key_Code_2(length(Key_Code_2));
    else
        k2(i) = Key_Code_2(mod(i, length(Key_Code_2)));
    end
end

numRows2 = ceil(length(k2) / c);
p2 = numRows2 * c - length(k2); % Padding
k2 = [k2, zeros(1, p2)];        % Pad with zeros
kk2 = reshape(k2, c, []).';     % Reshape into matrix with c columns

for iii = 1:r
    for jjj = 1:c
        if kk2(iii, jjj) - yyy + 1 > C(iii, jjj)
            D(iii, jjj) = C(iii, jjj) + B - kk2(iii, jjj) + yyy - 1 + 1;
        else
            D(iii, jjj) = C(iii, jjj) - kk2(iii, jjj) + yyy - 1 + 1;
        end
    end
end

Decrypted_Code = D + yyy - 1;
figure(3);
image(Decrypted_Code);
