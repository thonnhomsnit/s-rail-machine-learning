cd C:\Users\Personal\Desktop\response-data
disp = zeros(1000,81);
force = zeros(1000,81);
energy = zeros(1000,81);

for i=1:81
fdfile = append("fd",num2str(i),".csv");
edfile = append("ed",num2str(i),".csv");
fd = readmatrix(fdfile);
ed = readmatrix(edfile);
disp(:,i) = fd(:,1);
force(:,i) = fd(:,2);
energy(:,i) = ed(:,2);
end

cd 'D:\terminated_doe' 
tr = [1 1.5 2];
section = [120 140 160];
l = [300 400 500];
thick = [2 3.5 5];
mass=[0];

for a=1:3   %% 3-level tr
    for b=1:3 %% 3-level section
        for c=1:3 %% 3-level l
            for d=1:3 %% 3-level thick
                path = append('tr',num2str(tr(a)),'-',num2str(section(b)),'-',num2str(l(c)),'-',num2str(thick(d)));
                cd(path);
                fileID = fopen('d3hsp','r'); %% read d3hsp. read only.
                A = regexp(fileread('d3hsp'),'\n','split');
                whichline = find(contains(A,'t o t a l  m a s s'));
                for u=1:(whichline-1) %% go to specific line
                    fgetl(fileID);
                end
                fseek(fileID,0,'cof');
                read = str2num(extractAfter(fscanf(fileID,' %c',20),'='));
                mass(end+1,1) = (read*1000)-300;
                fclose('all')

                oldFolder = cd('D:\terminated_doe');
                cd
            end
        end
    end
end

mass(1)=[];

