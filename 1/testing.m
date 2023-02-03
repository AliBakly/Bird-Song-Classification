cellouter= {};
for i=1:15
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
        %figure()
        y=Xmat(:,j);
        cellinner{j}= y(1:find(y,1,'last'));%remove0(Xmat(:,j));
        %window=2048;
        %NFFT=16384;
        %noverlap=1024;
        %spectrogram(cellinner{j},window,noverlap,NFFT,F_s, 'yaxis');
    end
    cellouter{i}= cellinner;
    %figure(200+i)
    %NFFT=2048;
    %[R,f]=periodogram(Xmat(:,1),[],NFFT,F_s);
    %plot(f,10*log10(R))
end
%% remove 15 totally
cellouter(15)=[];
%%
FolderName = ('C:\Users\Ali\Desktop\fågelbilder');   % using my directory
FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
for iFig = 1:length(FigList)
  FigHandle = FigList(iFig);
  FigName   = num2str(get(FigHandle, 'Number'));
  set(0, 'CurrentFigure', FigHandle);
%   saveas(FigHandle, strcat(FigName, '.png'));
  saveas(FigHandle, fullfile(FolderName,strcat(FigName, '.png'))); % specify the full path
end
%%
cellouter= {};
i=1
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
        %figure(100+j)
        window=256;
        NFFT=1024;
        noverlap=128;
        %spectrogram(Xmat(:,j),window,noverlap,NFFT,F_s, 'yaxis');
        y=Xmat(:,j);
        cellinner{j}= y(1:find(y,1,'last'));%remove0(Xmat(:,j));
        %figure(200+j)
        f = figure('visible','on');
        spectrogram(cellinner{j},window,noverlap,NFFT,F_s, 'yaxis');
    end
    cellouter{i}= cellinner;
    %figure(200+i)
    %NFFT=2048;
    %[R,f]=periodogram(Xmat(:,1),[],NFFT,F_s);
    %plot(f,10*log10(R))
%set(gca, 'Visible', 'off');
%colorbar('off');
%saveas(gcf,'spect01.png');
 