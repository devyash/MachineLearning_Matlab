function [I,f ] = Reader(dirName)
%Returns Image Matrix
 %name of the directory
D = dir(dirName); %command to check files in directory
I=[];
for (i=3:length(D)) % a loop of how many file in such directory
  if ( strcmp(D(i).name(end-3:end), '.pgm') == 1) % string compare
   
      filename=strcat(dirName,'\',D(i).name);
      f{i-2,:}=filename;
      a=double(imread(filename));
      a=a(:);
      I=[I,a];
      
  end
end
end
