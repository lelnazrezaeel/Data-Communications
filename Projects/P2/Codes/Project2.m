%Part2
clc
clear
[y, Fs] = audioread ('Recording.wav');
player = audioplayer (y,Fs);
play(player);

%Part3
disp(length(y))
disp(Fs)

%Part4
hist = histogram(y, 'Normalization' , 'Probability');
hisgrm = hist.Values;
hisgrm= hisgrm./length(y);
X = hisgrm;
l=length(X); 
entro= 0;
for i=1:l
     if X(i)~=0
        hist = X(i)*log2(X(i));  
        entro = entro-hist; 
     end
end
display(entro)
display(entro*length(y)/8000)
display(length(y)/1000)
grid on

%Part5
uniq=unique(y);
uniq2 = zeros(1,length(uniq));
u = zeros(1,length(uniq)+1);
for i=1:length(uniq)
   uniq2(i)=uniq(i) ;
   u(i)=uniq(i);
end
u(length(uniq)+1)=2;
hist=histogram(y,u);
res=hist.Values./length(y);
dict=huffmandict(uniq2,res);
compressdata=huffmanenco(y,dict);
disp(length(compressdata)/8000)
disp(length(compressdata)/64000)
