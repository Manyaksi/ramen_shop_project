<%@ page contentType="text/html; charset=utf-8" %>
<html lang="en" adlesseunifierdata="[&quot;{\&quot;v\&quot;:false,\&quot;id\&quot;:\&quot;com.kwizzu.fastesttube\&quot;,\&quot;name\&quot;:\&quot;FastestTube\&quot;,\&quot;isComponentMode\&quot;:true}&quot;]"><head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>jQuery Scrollify - Power steering for your scroll wheel</title>
		<meta name="description" content="A jQuery plugin that assists scrolling and smoothly snaps to sections.">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<meta property="og:title" content="jQuery Scrollify - Power steering for your scroll wheel">
		<meta property="og:type" content="website">
		<meta property="og:description" content="A jQuery plugin that assists scrolling and smoothly snaps to sections.">
		<meta property="og:image" content="http://projects.lukehaas.me/scrollify/images/scrollify-screenshot.jpg">
		<meta property="og:url" content="http://projects.lukehaas.me/scrollify">
		<!--[if lt IE 9]>
		<script src="script/html5shiv.min.js"></script>
		<![endif]-->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:300">
		<link rel="stylesheet" href="style/main.css">

	<style type="text/css"></style><style type="text/css">.adlesse-hidden{display:none!important;}				.adlesse-invisible{visibility:hidden!important;}				.adlesse-actionpanel{padding:0!important; margin:0!important; position:absolute!important; z-index:3999!important; border:solid #000000 1px!important; background:#ffffff!important; font-family:sans-serif!important; font-weight:normal!important; font-size:10px!important; text-decoration:none!important; color:#000000!important;}				.adlesse-actionpanel a{padding:0!important; margin:0!important; background:none repeat scroll 0 0 transparent!important; font-family:sans-serif!important; font-weight:normal!important; font-size:10px!important; text-decoration:none!important; color: #000000!important; display: inline-block !important }				.adlesse-actionpanel a:hover{text-decoration:underline!important; }				.adlesse-trans-65{opacity:0.65; filter:alpha(opacity=65); -moz-opacity:0.65; filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=65); -khtml-opacity: 0.65; -ms-filter: 'progid:DXImageTransform.Microsoft.Alpha(Opacity=65)';}				.adlesse-rounded-corner{-moz-border-radius:3px; -webkit-border-radius:3px; -khtml-border-radius:3px; border-radius:3px;}								.adlesse-actionpanel-menu{position:absolute!important; z-index:3999!important;background:#ffffff!important; font-family:sans-serif!important; font-weight:normal!important; font-size:10px!important; text-decoration:none!important; color: #000000!important; border:1px solid #000000;text-align:center!important;padding:0!important; margin:5px!important; margin-top:1px!important;min-width:55px;}				.adlesse-actionpanel-menu-h {margin: 5px;list-style-type: none;}				.adlesse-actionpanel-menu-v {list-style-type: none;} 				.adlesse-actionpanel-menu-h li{background:#ffffff; cursor:pointer; display: inline-block; padding: 5px; zoom: 1;*display: inline;border-right:1px solid #cccccc}				.adlesse-actionpanel-menu-v li{background:#ffffff;cursor:pointer;padding:3px; border-bottom: 1px solid #000000;}								.adlesse-widget-div{}				.adlesse-widget-iframe{border:0px; position: relative; z-index: 205!important}</style></head>
	<body promptdialogcheckdone="1">
		<section class="panel home" data-section-name="home" style="height: 402px;">
			<div class="inner">
				<header>
					<h1>SCROLLIFY</h1>
					<p class="tagline">Power steering for your scroll wheel</p>
				</header>
				<p>A jQuery plugin that assists scrolling and smoothly snaps to sections.</p>
				<p>Fully configurable and optimised for touch.</p>
				<p><a href="https://github.com/lukehaas/Scrollify" target="_blank">https://github.com/lukehaas/Scrollify</a></p>
				<a href="#overview" class="scroll">Scroll for more</a>
				<a href="http://twitter.com/lukehaas" target="_blank" class="twitter"><img src="images/me.jpeg" width="45" height="45" alt="Twitter pic"><span>Created by @lukehaas</span></a>
			</div>
		</section>
		<section class="panel overview" data-section-name="overview" style="height: 402px;">
			<div class="inner">
				<h2>Basic Setup</h2>
				<p>Scrollify requires <a href="http://jquery.com/" target="_blank">jQuery</a> 1.6+ and an easing library such as <a href="http://gsgd.co.uk/sandbox/jquery/easing/" target="_blank">jquery.easing.js</a>.</p>
				<pre>	&lt;! doctype html&gt;
	&lt;html&gt;
		&lt;head&gt;
			&lt;script&gt;
				$(function() {
					$.scrollify({
						section : "section",
					});
				});
			&lt;/script&gt;
		&lt;/head&gt;
		&lt;body&gt;
			&lt;section&gt;&lt;/section&gt;
			&lt;section&gt;&lt;/section&gt;
		&lt;/body&gt;
	&lt;/html&gt;
				</pre>
			</div>
		</section>
		<section class="panel configuration" data-section-name="configuration" style="height: 402px;">
			<div class="inner">
			<h2>Configuration</h2>
				<pre>	$.scrollify({
		section : "section",
		sectionName : "section-name",
		easing: "easeOutExpo",
		scrollSpeed: 1100,
		offset : 0,
		scrollbars: true,
		before:function() {},
		after:function() {}
	});
				</pre>

			</div>
		</section>
		<section class="panel options" data-section-name="options" style="height: 402px;">
			<div class="inner">
				<h2>Options</h2>
				<dl>
					<dt>section</dt>
					<dd>A selector for the sections.</dd>
					<dt>sectionName</dt>
					<dd>Scrollify lets you define a hash value for each section. This makes it possible to permalink to particular sections. This is set as a data attribute on the sections. The name of the data attribute is defined by 'sectionName'.</dd>
					<dt>easing</dt>
					<dd>Define the easing method.</dd>
					<dt>offset</dt>
					<dd>A distance in pixels to offset each sections position by.</dd>
					<dt>scrollbars</dt>
					<dd>A boolean to define whether scroll bars are visible or not.</dd>
					<dt>before</dt>
					<dd>A callback that is called before a section is scrolled to via the move method. Arguments include the index of the section and an array of all section elements.</dd>
					<dt>after</dt>
					<dd>A callback that is called after a new section is scrolled to. Arguments include the index of the section and an array of all section elements.</dd>
				</dl>
			</div>
		</section>
		<section class="panel methods" data-section-name="methods" style="height: 402px;">
			<div class="inner">
				<h2>Methods</h2>
				<p>The move method can be used to scroll to a particular section. This can take the index of the section, or the name of the section preceded by a hash.</p>
				<pre>	$.scrollify("move","#name");
				</pre>
			</div>
		</section>

		<script async="" src="//www.google-analytics.com/analytics.js"></script><script src="script/jquery-1.6.js"></script>
		<!--<script src="script/jquery-2.1.1.js"></script>-->
		<!--<script src="script/jquery-1.11.1.js"></script>-->
		<script src="script/jquery.easing.1.3.js"></script>
		<script src="script/scrollify.min.js"></script>
		<script src="script/main.js"></script>
		<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		ga('create', 'UA-50992962-1', 'lukehaas.me');
		ga('send', 'pageview');</script>
	
</body></html>