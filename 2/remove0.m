function [signalOut] = remove0(signal)
signalOut= signal;
a = true;

while a
    if signalOut(length(signalOut))==0
        signalOut(length(signalOut))=[];
    else
        a = false;
    end
end

