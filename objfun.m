mat =  [1.2 140 400 4.5;1.2 140 400 2.5; 2 120 300 3.5];
answer = objfun(mat);
load avgdisp.mat

function [Y] = objfun(x)
annipfsea = poslin81(x);
annipf = annipfsea(:,1);
mass = ANNmass(x);

ea = lstm(x); % get ea from lstm prediction

lstmsea = -ea./mass;
Y = [annipf lstmsea];
end

function [ea] = lstm(x)
load avgdisp.mat
for i = 1:3
    input = [0 0 0 0;x(i,:)];
    csvwrite('matlabinput.csv', input);
    system('C:\Users\Personal\Documents\GitHub\optimization-execution\dist\lstm.exe'); % run the executable file
    force = csvread('pythonoutput.csv');
    disp = disp;
    delta_disp = [disp; 0]-[0; disp];
    sum_force = [force; 0]+[0; force];

    [row] = find(disp<260, 1, 'last');
    area = 0.5.*(delta_disp(1:row,1)).*(sum_force(1:row,1));
    ea(i,1) = sum(area);
end
end