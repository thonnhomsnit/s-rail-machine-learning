name ='D:\terminated_doe\tr2-160-500-';
tr = [1 1.5 2 3];
A = [100 120 140 160];
L = [300 400 500];
T = [2 3.5 5];
col = 1;
for a = 4
    for b = 4
        for c = 1
            for d = 1:3
forcename = ['D:\terminated_doe\tr',num2str(tr(1,a)),'-',num2str(A(1,b)),'-',num2str(L(1,c)),'-',num2str(T(1,d)),'\rwforc'];
[rwforc,n] = fetch_force(forcename);
forcetimestep(1:n,col) = rwforc;

dispname = ['D:\terminated_doe\tr',num2str(tr(1,a)),'-',num2str(A(1,b)),'-',num2str(L(1,c)),'-',num2str(T(1,d)),'\nodout'];
[nodout,n] = fetch_disp(dispname);
disptimestep(1:n,col) = nodout;

energyname = ['D:\terminated_doe\tr',num2str(tr(1,a)),'-',num2str(A(1,b)),'-',num2str(L(1,c)),'-',num2str(T(1,d)),'\glstat'];
[glstat,n] = fetch_energy(energyname);
energytimestep(1:n,col) = glstat;

massname = ['D:\terminated_doe\tr',num2str(tr(1,a)),'-',num2str(A(1,b)),'-',num2str(L(1,c)),'-',num2str(T(1,d)),'\d3hsp'];
[d3hsp] = fetch_mass(massname);
massname(1,col) = d3hsp;

col = col+1;
            end
        end
    end
end

function [rwforc,n] = fetch_force(forcename)

startRow = 8;
endRow = 508;

formatSpec = '%*35s%15f%[^\n\r]';

fileID = fopen(forcename,'r');

textscan(fileID, '%[^\n\r]', startRow-1, 'WhiteSpace', '', 'ReturnOnError', false);
dataArray = textscan(fileID, formatSpec, endRow-startRow+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');

fclose(fileID);

rwforc = [dataArray{1:end-1}];
n = numel(rwforc);
clearvars filename startRow endRow formatSpec fileID dataArray ans;
end

function [nodout,n] = fetch_disp(dispname)
%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 75);

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = " ";

% Specify column names and types
opts.VariableNames = ["Var1", "Var2", "d", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17", "Var18", "Var19", "Var20", "Var21", "Var22", "Var23", "Var24", "Var25", "Var26", "Var27", "Var28", "Var29", "Var30", "Var31", "Var32", "Var33", "Var34", "Var35", "Var36", "Var37", "Var38", "Var39", "Var40", "Var41", "Var42", "Var43", "Var44", "Var45", "Var46", "Var47", "Var48", "Var49", "Var50", "Var51", "Var52", "Var53", "Var54", "Var55", "Var56", "Var57", "Var58", "Var59", "Var60", "Var61", "Var62", "Var63", "Var64", "Var65", "Var66", "Var67", "Var68", "Var69", "Var70", "Var71", "Var72", "Var73", "Var74", "Var75"];
opts.SelectedVariableNames = "d";
opts.VariableTypes = ["string", "string", "double", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.LeadingDelimitersRule = "ignore";

% Specify variable properties
opts = setvaropts(opts, ["Var1", "Var2", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17", "Var18", "Var19", "Var20", "Var21", "Var22", "Var23", "Var24", "Var25", "Var26", "Var27", "Var28", "Var29", "Var30", "Var31", "Var32", "Var33", "Var34", "Var35", "Var36", "Var37", "Var38", "Var39", "Var40", "Var41", "Var42", "Var43", "Var44", "Var45", "Var46", "Var47", "Var48", "Var49", "Var50", "Var51", "Var52", "Var53", "Var54", "Var55", "Var56", "Var57", "Var58", "Var59", "Var60", "Var61", "Var62", "Var63", "Var64", "Var65", "Var66", "Var67", "Var68", "Var69", "Var70", "Var71", "Var72", "Var73", "Var74", "Var75"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var2", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17", "Var18", "Var19", "Var20", "Var21", "Var22", "Var23", "Var24", "Var25", "Var26", "Var27", "Var28", "Var29", "Var30", "Var31", "Var32", "Var33", "Var34", "Var35", "Var36", "Var37", "Var38", "Var39", "Var40", "Var41", "Var42", "Var43", "Var44", "Var45", "Var46", "Var47", "Var48", "Var49", "Var50", "Var51", "Var52", "Var53", "Var54", "Var55", "Var56", "Var57", "Var58", "Var59", "Var60", "Var61", "Var62", "Var63", "Var64", "Var65", "Var66", "Var67", "Var68", "Var69", "Var70", "Var71", "Var72", "Var73", "Var74", "Var75"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, "d", "TrimNonNumeric", true);
opts = setvaropts(opts, "d", "ThousandsSeparator", ",");

filename = dispname;

nod = readtable(filename, opts);
nod = table2array(nod);

 for j = 1:501
     line = 1+14.*j;
     fetch(j,1) = nod(line,1);
     j=j+1;
 end
n = numel(fetch);
nodout(1:n,1)=fetch(:,1);
clear opts
end

function [glstat,n] = fetch_energy(energyname)

opts = delimitedTextImportOptions("NumVariables", 40);

% Specify range and delimiter
opts.DataLines = [10:23:11510;10:23:11510]';
opts.Delimiter = " ";

% Specify column names and types
opts.VariableNames = ["Var1", "Var2", "Var3", "Var4", "LSPrePost", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17", "Var18", "Var19", "Var20", "Var21", "Var22", "Var23", "Var24", "Var25", "Var26", "Var27", "Var28", "Var29", "Var30", "Var31", "Var32", "Var33", "Var34", "Var35", "Var36", "Var37", "Var38", "Var39", "Var40"];
opts.SelectedVariableNames = "LSPrePost";
opts.VariableTypes = ["string", "string", "string", "string", "double", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.LeadingDelimitersRule = "ignore";

% Specify variable properties
opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var4", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17", "Var18", "Var19", "Var20", "Var21", "Var22", "Var23", "Var24", "Var25", "Var26", "Var27", "Var28", "Var29", "Var30", "Var31", "Var32", "Var33", "Var34", "Var35", "Var36", "Var37", "Var38", "Var39", "Var40"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var4", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17", "Var18", "Var19", "Var20", "Var21", "Var22", "Var23", "Var24", "Var25", "Var26", "Var27", "Var28", "Var29", "Var30", "Var31", "Var32", "Var33", "Var34", "Var35", "Var36", "Var37", "Var38", "Var39", "Var40"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, "LSPrePost", "TrimNonNumeric", true);
opts = setvaropts(opts, "LSPrePost", "ThousandsSeparator", ",");

% Import the data
glstat = readtable(energyname, opts);
glstat = table2array(glstat);
n = numel(glstat);
clear opts
end

function [d3hsp] = fetch_mass(massname)
A = regexp(fileread(massname),'\n','split');
whichline = find(contains(A,'t o t a l  m a s s'));
fclose('all');

fid=fopen(massname);

B = textscan(fid,'%s',1,'delimiter','\\', 'headerlines',whichline-1);
B = string(B);
B = regexp(B,' ','split');
B = str2num(B(1,21));
d3hsp = B-300;
end
