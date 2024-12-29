clc
close all
clear all

%%Taking_Input_Message:
Input_Message=input('\nEnter the message: ','s');
ASCII_Code=Input_Message-0;



%%Forming_Vigenere_Matrix:
b=8;
B=2^8;
for i=1:B
    for j=1:B
        if mod(i+j-1,B)==0
            V(i,j)=B;
        else V(i,j)=mod(i+j-1,B);
        end
    end
end

%%Setting_Password:
ll=length(ASCII_Code);
Key=input('\nSet the Key: ','s');
Key_Code=Key-0;


%%Encryption:
for i=1:length(ASCII_Code)
    if mod(i,length(Key_Code))==0
        k(i)=Key_Code(length(Key_Code));
    else k(i)=Key_Code(mod(i,length(Key_Code)));
    end
end
kk=char(k);
for ii=1:ll
    C(ii)=V(k(ii),ASCII_Code(ii));
end
Cipher_Text=char(C)


%%Giving_Password:
ll2=length(ASCII_Code);
Key2=input('\nEnter the Password: ','s');
Key_Code2=Key2-0;

%%Decryption:
for i=1:length(ASCII_Code)
    if mod(i,length(Key_Code2))==0
        k2(i)=Key_Code2(length(Key_Code2));
    else k2(i)=Key_Code2(mod(i,length(Key_Code2)));
    end
end
for iii=1:ll2
    if k2(iii)>C(iii)
        D(iii)=C(iii)+B-k2(iii)+1;
    else D(iii)=C(iii)-k2(iii)+1;
    end
end
Decrypted_Text=char(D)

        

