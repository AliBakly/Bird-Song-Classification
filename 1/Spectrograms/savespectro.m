counter=1;
for i=1:length(cellouter)
    for j=1:length(cellouter{i})
        window=256;
        NFFT=1024;
        noverlap=128;
        f = figure('visible','off');
        spectrogram(cellouter{i}{j},window,noverlap,NFFT,F_s, 'yaxis');
        set(gca, 'Visible', 'off');
        colorbar('off');
        exportgraphics(gcf,append(int2str(counter),'.jpg'),'Resolution',300);
        counter=counter+1;
    end
end
