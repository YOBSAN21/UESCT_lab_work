select s.SID,studentName,GPA,c.CollegeName,Enrollement
from student s,college c,apply a
where s.SID = a.SID and a.CollegeName = c.CollegeName;