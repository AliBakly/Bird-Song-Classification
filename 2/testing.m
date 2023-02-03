cellouter= {};
for i=1:17
    file = append(int2str(i),'.mp3');
    [signal, F_s] = audioread(file);
    signal=signal(:,1);
    signal=decimate(signal,2);
    F_s=F_s/2;
    signal= bandpass(signal,[1000,10000], F_s);
    %figure(i+1)
    try
    [Xmat,Tmat]=syllablecutmod(signal, F_s,200,5,500,2000,250);
    cellinner={};
    i;
    for j=1:length(Xmat(1,:))
        j;
        y=Xmat(:,j);
        cellinner{j}= y(1:find(y,1,'last'));%remove0(Xmat(:,j));
    end
    cellouter{i}= cellinner;
    catch
    end
    %figure(200+i)
    %NFFT=2048;
    %[R,f]=periodogram(Xmat(:,1),[],NFFT,F_s);
    %plot(f,10*log10(R))
end
%%
cellouter= {};
i=3
    file = append(int2str(i),'.mp3');
    [signal, F_s] = audioread(file);
    signal=signal(:,1);
    signal=decimate(signal,2);
    F_s=F_s/2;
    signal= bandpass(signal,[1000,10000], F_s);
    %figure(i+1)
    [Xmat,Tmat]=syllablecutmod(signal, F_s,200,5,500,2000,250);
    cellinner={};
    i;
    for j=1:length(Xmat(1,:))
        j;
        window=2048;
        NFFT=8192;
        noverlap=1024;
        spectrogram(Xmat(:,j),window,noverlap,NFFT,F_s, 'yaxis');
        cellinner{j}=remove0(Xmat(:,j));
        figure(400+j)
        spectrogram(cellinner{j},window,noverlap,NFFT,F_s, 'yaxis');
        %colormap gray
    end
    cellouter{i}= cellinner;
    %figure(200+i)
    %NFFT=2048;
    %[R,f]=periodogram(Xmat(:,1),[],NFFT,F_s);
    %plot(f,10*log10(R))
%%
figure(21)
soundsc(cellouter{17}{1},F_s)
    NFFT=2048;
    [R,f]=periodogram(cellouter{17}{1},[],NFFT,F_s);
    plot(f,10*log10(R))
    
%% Cleaning
cellouter{15}(5)=[];
cellouter{15}(3)=[];
cellouter{15}(2)=[];
cellouter{15}(1)=[];
cellouter{12}(5)=[];
cellouter{12}{3}=cellouter{12}{3}(1:length(cellouter{12}{3})/3);%70% of end is just noise
cellouter(11)=[]; %%nothing found
cellouter(9)=[]; % not same?
cellouter(8)=[]; %%nothing found
cellouter{7}(1)=[];
cellouter{6}(5)=[];

