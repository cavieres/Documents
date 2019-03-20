  update [dbo].[REMPLES]
  /* set pmail = (select char((rand()*25 + 65))+char((rand()*25 + 65)) + '@adp.com') */
 set pmail = convert(varchar(5), 10000 + ABS(CHECKSUM(NEWID())) % 90000) + '@adasd.com'
 
   update [dbo].[REMPLES]
  /* set pmail = (select char((rand()*25 + 65))+char((rand()*25 + 65)) + '@adp.com') */
 set ubica = '1'