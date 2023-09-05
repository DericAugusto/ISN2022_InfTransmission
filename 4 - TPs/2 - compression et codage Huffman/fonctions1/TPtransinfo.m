s = 'abracadabra';

snum = int8(s);
sbin1 = dec2bin(snum,8)';

sbin = str2double(sbin1(:));

% Paramètres

spb = 10; % sample par bit

Tm = 10^-3; % période des moments

Ts = Tm/spb; % période des samples

N = length(sbin);

Fe = 1/Ts;

V0 = 1;

base_t = 0 : Ts : N*Tm-Ts;

Rf = Fe/length(base_t);

base_f = -Fe/2 : Rf : Fe/2-Rf;

ech = repmat(sbin,1,spb)';

ech_vect = ech(:)*V0;

base_t_redim = repmat(base_t,1,spb);

%plot(base_t , ech_vect);

ech_polaire0 = ech_vect*2*V0;

ech_polaire1 = ech_polaire0-V0;

%plot(base_t , ech_polaire1);

ech_vect_man = ech_vect;

%Utilisation de l'horloge

clk = square(2*pi*base_t/Tm);
%plot(base_t,clk);

%Manchester1
for i = 0:(length(ech_vect_man)/10)-1
    if ech_vect(10*i+1) == 0
        for n = 10*i+1 : 10*i+5 
            ech_vect_man(n) = -1;
        end
        
        for m = 10*i+6 : 10*i+10
            ech_vect_man(m) = 1;
        end
    else 
        for n = 10*i+1 : 10*i+5
            ech_vect_man(n) = 1;
        end
        
        for m = 10*i+6 : 10*i+10
            ech_vect_man(m) = -1;
        end
    end
end

%Manchester2

%figure, plot(base_f , abs(fftshift(fft(ech_vect))));
%figure, plot(base_f , abs(fftshift(fft(ech_polaire1))));
%figure, plot(base_f , abs(fftshift(fft(ech_vect_man))));

%signal filtre

Fc = 1000; 
[b,a ]= butter(2,2*Fc/Fe);
s_filt = filter(b,a,ech_vect);
sb = awgn(s_filt,45,'measured');
%figure, plot(base_t,ech_vect);
%figure, plot(base_t,sb);

sb_ech = sb(1:spb:length(ech_vect)); 

%on essaie de recuperer le signal de base
for i=1:length(sb_ech)
    if sb_ech(i)<=V0/2
        sb_ech(i)=0;
    else
        sb_ech(i)=1;
    end
end

%sb_str = num2str(sb_ech)

sb_strcat = ['';'';'';'';'';'';'';''];
for j=0:length(sb_ech)/8-1
    for i = 10*j+1 : 10*j+10
        sb_strcat(j+1) = strcat(sb_strcat(j+1),sb_str(i));
    end 
end

%sb_num = bin2dec(sb_ech)


