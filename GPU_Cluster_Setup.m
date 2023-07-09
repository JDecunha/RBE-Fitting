configCluster
c = parcluster;
c.AdditionalProperties.WallTime = '02:00';
c.AdditionalProperties.MemUsage = '16';
c.AdditionalProperties.GpusPerNode = 1;
c.AdditionalProperties.GpuMemUsage = "16";
c.AdditionalProperties.AdditionalSubmitArgs = '-n 2'; 
c.saveProfile

%-q egpu-medium -gpu num=1:gmem=16
%j = c.batch(@H460_Linear_BWF_Fitting, 1,{},'AutoAddClientPath',true,'CurrentFolder','.');