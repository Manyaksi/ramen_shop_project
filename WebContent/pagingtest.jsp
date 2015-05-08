<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body>

<script type="/js/lib.paging.js"></script>
<script type="text/javascript">
PG = new Paging(300);

PG.config ={
		thisPageStyle : 'font-weight : bold; color:#33B7FB',
		itemPerPage: 15,
		pagePerView:15
}

document.write(PG);
</script>
<br><br>
<script type="text/javascript">
document.write(new Paging(3000));
</script>

</body>
</html>