configCluster
c = parcluster;
c.AdditionalProperties.WallTime = '02:00';
c.AdditionalProperties.MemUsage = '16';
c.AdditionalProperties.AdditionalSubmitArgs = '-q egpu-medium -n 2 -gpu num=1:gmem=16';
c.saveProfile
%j = c.batch(@H460_Linear_BWF_Fitting, 1,{},'AutoAddClientPath',true,'CurrentFolder','.');