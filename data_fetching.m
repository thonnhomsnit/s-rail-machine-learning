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