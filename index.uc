#!/usr/bin/ucode
{%
	let fs = require("fs");
	let data = json(fs.open("releases.json", "r").read("all"));

	let stable = data.branches[keys(data.branches)[0]];
	stable.name = keys(data.branches)[0];
	let stable_latest = stable.minor[keys(stable.minor)[0]];
	stable_latest.name = keys(stable.minor)[0];

	let oldstable = data.branches[keys(data.branches)[1]];
	oldstable.name = keys(data.branches)[1];
	let oldstable_latest = oldstable.minor[keys(oldstable.minor)[0]];
	oldstable_latest.name = keys(oldstable.minor)[0];
%}

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html>

<head>
	<meta http-equiv="content-type" content="text/html; charset=windows-1252">
	<title>OpenWrt Downloads</title>
	<style type="text/css">
		html,
		body {
			margin: 0;
			padding: 0;
			height: 100%;
		}

		body {
			color: #333;
			padding-top: 2em;
			font-family: Helvetica, Arial, sans-serif;
			width: 90%;
			min-width: 700px;
			max-width: 1100px;
			margin: auto;
			font-size: 120%;
			background-color: #ddd;
		}

		h1 {
			font-size: 120%;
			line-height: 1em;
		}

		h2 {
			font-size: 100%;
			line-height: 1em;
		}

		h3 {
			font-size: 90%;
			line-height: 1em;
		}

		p,
		li {
			font-size: 14px;
		}

		a:link,
		a:visited {
			color: #337ab7;
			font-weight: bold;
			text-decoration: none;
		}

		a:hover,
		a:active,
		a:focus {
			color: #23527c;
			text-decoration: underline;
		}

		footer {
			font-size: 80%;
			text-align: right;
			margin: 1em 0;
		}
	</style>
</head>

<body>
	<h1>OpenWrt Downloads</h1>
	<div>
		<p>
			Welcome to the OpenWrt download area. Follow the links below to
			find the appropriate directory.
		</p>
		<hr>

		<h2>Stable Release</h2>
		<p>
			The current OpenWrt {{ stable.name }} release is linked below. It
			is adviced to use the latest available release if possible.
		</p>
		<ul>
			<li>
				<strong><a href="releases/{{ stable_latest.name }}/targets/">OpenWrt {{ stable_latest.name
						}}</a></strong><br>
				<small>Released: {{ stable_latest.release_date }}</small><br /><br />
			</li>
		</ul>
		<hr>

		<h3>Old Stable Release</h3>
		<p>
			The OpenWrt {{ oldstable.name }} release is considered outdated but
			will still receive limited security and bug fixes for some time.
		</p>
		<ul>
			<li>
				<strong><a href="releases/{{ oldstable_latest.name }}/targets/">OpenWrt {{ oldstable_latest.name
						}}</a></strong><br>
				<small>Released: {{ oldstable_latest.release_date }}</small><br /><br />
			</li>
		</ul>
		<hr>

		<h3>Development Snapshots</h3>
		<p>
			Development snapshots are automatic unattended daily builds of the current
			OpenWrt development master branch. Bear in mind that these images are generally
			not tested, use them at your own risk.
		</p>
		<ul>
			<li><a href="snapshots/targets/">Snapshot download</a></li>
		</ul>
		<hr>

		<h3>Release Archive</h3>
		<p>
			The releases linked below are mostly for historic interest - they're generally
			out of date and no longer maintained.
		</p>
		<ul>
			{% for (branch in data.branches): %}
			{% for (minor in splice(keys(data.branches[branch].minor), 0, 1)): %}
			<li><a href="https://archive.openwrt.org/releases/{{ minor }}/targets/">OpenWrt {{ minor }}</a></li>
			{% endfor %}
			{% endfor %}
			<!-- legacy releases-->
			<li><a href="https://archive.openwrt.org/releases/18.06.9/targets/">OpenWrt 18.06.9</a></li>
			<li><a href="https://archive.openwrt.org/releases/18.06.8/targets/">OpenWrt 18.06.8</a></li>
			<li><a href="https://archive.openwrt.org/releases/18.06.7/targets/">OpenWrt 18.06.7</a></li>
			<li><a href="https://archive.openwrt.org/releases/18.06.6/targets/">OpenWrt 18.06.6</a></li>
			<li><a href="https://archive.openwrt.org/releases/18.06.5/targets/">OpenWrt 18.06.5</a></li>
			<li><a href="https://archive.openwrt.org/releases/18.06.4/targets/">OpenWrt 18.06.4</a></li>
			<li><a href="https://archive.openwrt.org/releases/18.06.3/targets/">OpenWrt 18.06.3</a></li>
			<li><a href="https://archive.openwrt.org/releases/18.06.2/targets/">OpenWrt 18.06.2</a></li>
			<li><a href="https://archive.openwrt.org/releases/18.06.1/targets/">OpenWrt 18.06.1</a></li>
			<li><a href="https://archive.openwrt.org/releases/18.06.0/targets/">OpenWrt 18.06.0</a></li>
			<li><a href="https://archive.openwrt.org/releases/17.01.7/targets/">LEDE 17.01.7</a></li>
			<li><a href="https://archive.openwrt.org/releases/17.01.6/targets/">LEDE 17.01.6</a></li>
			<li><a href="https://archive.openwrt.org/releases/17.01.5/targets/">LEDE 17.01.5</a></li>
			<li><a href="https://archive.openwrt.org/releases/17.01.4/targets/">LEDE 17.01.4</a></li>
			<li><a href="https://archive.openwrt.org/releases/17.01.3/targets/">LEDE 17.01.3</a></li>
			<li><a href="https://archive.openwrt.org/releases/17.01.2/targets/">LEDE 17.01.2</a></li>
			<li><a href="https://archive.openwrt.org/releases/17.01.1/targets/">LEDE 17.01.1</a></li>
			<li><a href="https://archive.openwrt.org/releases/17.01.0/targets/">LEDE 17.01.0</a></li>
			<li><a href="https://archive.openwrt.org/chaos_calmer/15.05.1/">Chaos Calmer 15.05.1</a></li>
			<li><a href="https://archive.openwrt.org/chaos_calmer/15.05/">Chaos Calmer 15.05</a></li>
			<li><a href="https://archive.openwrt.org/barrier_breaker/14.07/">Barrier Breaker 14.07</a></li>
			<li><a href="https://archive.openwrt.org/attitude_adjustment/12.09/">Attitude Adjustment 12.09</a></li>
			<li><a href="https://archive.openwrt.org/backfire/10.03.1/">Backfire 10.03.1</a></li>
			<li><a href="https://archive.openwrt.org/backfire/10.03/">Backfire 10.03</a></li>
			<li><a href="https://archive.openwrt.org/kamikaze/8.09.2/">Kamikaze 8.09.2</a></li>
			<li><a href="https://archive.openwrt.org/kamikaze/8.09.1/">Kamikaze 8.09.1</a></li>
			<li><a href="https://archive.openwrt.org/kamikaze/8.09/">Kamikaze 8.09</a></li>
			<li><a href="https://archive.openwrt.org/kamikaze/7.09/">Kamikaze 7.09</a></li>
			<li><a href="https://archive.openwrt.org/kamikaze/7.07/">Kamikaze 7.07</a></li>
			<li><a href="https://archive.openwrt.org/kamikaze/7.06/">Kamikaze 7.06</a></li>
			<li><a href="https://archive.openwrt.org/whiterussian/0.9/">Whiterussian 0.9</a></li>
		</ul>
	</div>

</body>

</html>
