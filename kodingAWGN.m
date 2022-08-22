%AWGN
function [messagefromkanal,yrx,nsamp]=kodingAWGN(message,SNR)
tic
%%setup
%Define parameter.
M = 6;                 % Size of signal constellation
k = log2(M);            % Number of bts per symbol
n = 3e4;                % Number of bits to process
nsamp = 1;              % Oversampling rate
hMod = qammod(M);  % Create a 16-QAM modulator
[a,b] = textscan(SNR,'%d%d','delimiter',':');
snr = a:b;
%% Signal Source
% Create a binary data stream as a column vector.
x = message; % Random binary data stream
%% Bit-to-Symbol Mapping
%Convert the bits in x into k-bit symbols.
xsym = bi2de(reshape(s,k,length(x)/k).','left-msb');
%% Modulation
y = modulate(qammod(M),xsym); % Modulate using 16-QAM.
%% Transmitted Signal
ytx = y;
%%
hx = waitbar(0,'Harap tunggu ...');
steps = size(snr,2);
for i=1:steps
    ynoisy = awgn(ytx,snr(1,i),'measured');
    %% Received Signal
    yrx = ynoisy;
    %% Demodulation
    % Demodulate signal using 16-QAM.
    zsym = demodulate(qamdemod(M),yrx);
    %% Symbol-to-Bit Mapping
    % Undo the bit-to-symbol mapping performed earlier.
    z = de2bi(zsym,'left-msb'); % Convert integers to bits.
    % Convert z form a matrix to a vector.
    zTrans=z';
    dataTerima(i,:)=reshape(zTrans,1,(length(zTrans(1,:))*length(zTrans(:,1)));
    waitbar(i/steps);
end
close(hx);
messagefromkanal=dataTerima;
message = messagefromkanal;
savefile = 'hasilpengiriman.mat';
save(savefile,'message');
toc