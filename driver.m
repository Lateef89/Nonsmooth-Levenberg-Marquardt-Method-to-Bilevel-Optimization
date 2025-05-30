
clear;
clc;

problem = {'LampSag2017c','Ex7a','Transport'};
pro = 3;
n = 5; l = 7; m = n*l; p = n+l+m;
nx = 5; ny = n*l; nG = n+1; ng = n+l+n*l;
dim = [nx, ny, nG, ng];
k=0;   
for i = 1:500
pars.xy =  ones(dim(1)+dim(2),1);
filename2 = 'RevisionData.xlsx';
 xx = rand(nx,1);
yy = rand(ny,1);
 
sheet = 1;
k = k+1;
xlrange = xlRange(1,k);
xlswrite(filename2,xx',sheet,xlrange);
xlrange = xlRange(8,k);
xlswrite(filename2,yy',sheet,xlrange);
probname = problem{pro};
addpath(strcat('Examples/',probname)); 
xlrange = xlRange(1,k);
fprintf('Method 1_LM: i = %2d', i); 
[w,xi,iter,lm_iter,lm_iter_part,term,err1] = Method1_LM(dim,pars,xlrange,xx,yy);
xlrange = xlRange(8,k);
fprintf('Method 1_Res: i = %2d\n', i);
[w_FB_res,xi_FB_res,iter_FB_res,lm_iter_FB,lm_iter_FB_part,term_FB_res,err2] = Method1_LM_FB_residual(dim,pars,xlrange,xx,yy);
xlrange = xlRange(15,k);
fprintf('Method 2_LM: i = %2d',i); 
[w,xi,iter,lm_iter,lm_iter_part,term,err3] = Method2_LM(dim,pars,xlrange,xx,yy);
xlrange = xlRange(22,k);
fprintf('Method 2_Res: i = %2d\n',i); 
[w_FB_res,xi_FB_res,iter_FB_res,lm_iter_FB,lm_iter_FB_part,term_FB_res,err4] = Method2_LM_FB_residual(dim,pars,xlrange,xx,yy);
xlrange = xlRange(29,k);
fprintf('Method 3_LM: i = %2d',i); 
[w,xi,iter,lm_iter,lm_iter_part,term,err5] = Method3_LM(dim,pars,xlrange,xx,yy);
xlrange = xlRange(36,k);
fprintf('Method 2_Res: i = %2d\n',i); 
[w_FB_res,xi_FB_res,iter_FB_res,lm_iter_FB,lm_iter_FB_part,term_FB_res,err6] = Method3_LM_FB_residual(dim,pars,xlrange,xx,yy);
   
end