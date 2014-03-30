//給textarea輸入框加上 character limited提示
$('textarea[class*=autosize]').autosize({append: "\n"});
$('textarea.limited').inputlimiter({
			remText: '%n character%s remaining...',
			limitText: 'max allowed : %n.'			
});


