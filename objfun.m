mat =  [0.5 0.5 0.5 0.5; 0 0 0 0; 0.1 0.1 0.1 0.1];
answer = objfun(mat);

function [Y] = objfun(x)
annipfsea = tansig81(x);
annipf = annipfsea(:,1);
mass = ANNmass(x);

ea = lstm(x); % get ea from lstm prediction

lstmsea = -lstm./mass;
Y = [annipf lstmsea];
end

function [ea] = lstm(x)
load avgdisp.mat
    for i = size(x,1)
        csvwrite('pythoninput.csv', x(i,:));
        system('C:\Users\Personal\Documents\GitHub\lstm_srail\dist\testmatlab\testmatlab.exe'); % run the executable file
        force = csvread('pythonoutput.csv');

        delta_disp = [disp; 0]-[0; disp];
        sum_force = [force; 0]+[0; force];

        % find last index that have disp < 260 mm
        [row] = find(disp<260, 1, 'last');
        area = 0.5.*([disp; 0]-[0; disp]).*([force; 0]+[0; force]);
        area = area(1:row);
        ea(i,1) = sum(area);
    end
end