//////////all trim methods

function Trim(TRIM_VALUE){
	if(TRIM_VALUE.length < 1){
		return"";
	}
	TRIM_VALUE = RTrim(TRIM_VALUE);
	TRIM_VALUE = LTrim(TRIM_VALUE);
	if(TRIM_VALUE==""){
	return "";
	}
	else{
	return TRIM_VALUE;
	}
} //End Function

function RTrim(VALUE){
	var w_space = String.fromCharCode(32);
	var s_r = String.fromCharCode(13);
	var s_n = String.fromCharCode(10);
	var s_t = String.fromCharCode(9);
	var v_length = VALUE.length;
	var strTemp = "";
	if(v_length < 0){
		return"";
	}
	var iTemp = v_length -1;

	while(iTemp > -1){
		if(VALUE.charAt(iTemp) == w_space || VALUE.charAt(iTemp) == s_r || VALUE.charAt(iTemp) == s_n || VALUE.charAt(iTemp) == s_t){
		}
		else{
			strTemp = VALUE.substring(0,iTemp +1);
			break;
		}
		iTemp = iTemp-1;

	} //End While
	return strTemp;

	} //End Function

function LTrim(VALUE){
	var w_space = String.fromCharCode(32);
	var s_r = String.fromCharCode(13);
	var s_n = String.fromCharCode(10);
	var s_t = String.fromCharCode(9);
	if(v_length < 1){
	return"";
	}
	var v_length = VALUE.length;
	var strTemp = "";

	var iTemp = 0;

	while(iTemp < v_length){
	if(VALUE.charAt(iTemp) == w_space || VALUE.charAt(iTemp) == s_r || VALUE.charAt(iTemp) == s_n || VALUE.charAt(iTemp) == s_t){
	}
	else{
		strTemp = VALUE.substring(iTemp,v_length);
		break;
	}
	iTemp = iTemp + 1;
	} //End While
	return strTemp;
} //End Function

function checkDate(dobStr)
{	var arr = dobStr.split(/-/);
	if(arr.length != 3){
		return false;
	}
	var ddStr = arr[0];
	var mmStr = arr[1];
	var yyStr = arr[2];
	if(isNaN(ddStr)){
		return false;
	}
	if(isNaN(mmStr)){
		return false;
	}
	if(isNaN(yyStr)){
		return false;
	}
	
	//if(yyStr.length == 1){
	//	yyStr = "200"+yyStr;
	//}
	//if(yyStr.length == 2){
	//	yyStr = "20"+yyStr;
	//}
	//if(yyStr.length == 3){
	//	yyStr = "2"+yyStr;
	//}
	
	dd=parseInt(ddStr,10);
	mm=parseInt(mmStr,10);
	yy=parseInt(yyStr,10);
	
	if(dd < 1 || dd > 31){
		return false;
	}
	if(mm < 1 || mm > 12){
		return false;
	}
	if(yy < 1900){
		return false;
	}
	if(yy > 3000){
		return false;
	}
	switch (mm)
	{
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			return true;
		case 4:
		case 6:
		case 9:
		case 11:
			if(dd<=30)
				return true;
			else
				return false;
		case 2:
			if(yy%100==0)
			{	if(yy%400==0)
				{
					if(dd<=29)
						return true;
					else
						return false;
				}
			}
			else
			{	if(yy%4==0)
				{
					if(dd<=29)
						return true;
					else
						return false;
				}
			}
			if(dd<=28)
			{	return true;
			}
			else
			{	return false;
			}
		default :
			return false;
	}
}
function checkUsDate(dobStr)
{	var arr = dobStr.split(/-/);
	if(arr.length != 3){
		return false;
	}
	var ddStr = arr[1];
	var mmStr = arr[0];
	var yyStr = arr[2];
	if(isNaN(ddStr)){
		return false;
	}
	if(isNaN(mmStr)){
		return false;
	}
	if(isNaN(yyStr)){
		return false;
	}
	
	//if(yyStr.length == 1){
	//	yyStr = "200"+yyStr;
	//}
	//if(yyStr.length == 2){
	//	yyStr = "20"+yyStr;
	//}
	//if(yyStr.length == 3){
	//	yyStr = "2"+yyStr;
	//}
	
	dd=parseInt(ddStr,10);
	mm=parseInt(mmStr,10);
	yy=parseInt(yyStr,10);
	
	if(dd < 1 || dd > 31){
		return false;
	}
	if(mm < 1 || mm > 12){
		return false;
	}
	if(yy < 1900){
		return false;
	}
	if(yy > 3000){
		return false;
	}
	switch (mm)
	{
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			return true;
		case 4:
		case 6:
		case 9:
		case 11:
			if(dd<=30)
				return true;
			else
				return false;
		case 2:
			if(yy%100==0)
			{	if(yy%400==0)
				{
					if(dd<=29)
						return true;
					else
						return false;
				}
			}
			else
			{	if(yy%4==0)
				{
					if(dd<=29)
						return true;
					else
						return false;
				}
			}
			if(dd<=28)
			{	return true;
			}
			else
			{	return false;
			}
		default :
			return false;
	}
}

function emailValidator(elem){
	var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
	if(elem.match(emailExp)){
		return true;
	}else{
		return false;
	}
}
function replaceEscapes(str){
	str=str.replace(new RegExp("&quot;","g"),"\"");
	str=str.replace(new RegExp("&apos;","g"),"\'");
	str=str.replace(new RegExp("escapen;","g"),"\\n");
	str=str.replace(new RegExp("escapeun;","g"),"\n");//this is for \n given by developer for next line in java code
	str=str.replace(new RegExp("escaper;","g"),"\\r");
	str=str.replace(new RegExp("escapet;","g"),"\\t");
	str=str.replace(new RegExp("escapef;","g"),"\\f");
	str=str.replace(new RegExp("escapeb;","g"),"\\b");
	str=str.replace(new RegExp("escape;","g"),"\\");
	return str;
}
function allowNumericInAmt(){
  if(event.shiftKey){
  	event.returnValue = false;
  }
  else if( (event.keyCode==45 || event.keyCode==46 || event.keyCode==8 || event.keyCode==9) ||
  	  (event.keyCode>=33 && event.keyCode<=40) ||
      (event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105) ||
      (event.keyCode==190 || event.keyCode==110)) {
			event.returnValue = true; 
  }
  else{
    event.returnValue = false;
  }
}
function allowIntegerValueNonNegative(e){
/*
	This function is used to enter only integer number without sign where e is event.
	This function should be called like this [onkeypress="allowIntegerValueNonNegative(event, this);"].
*/
	var key;
	key = (e.which) ? e.which : event.keyCode;
	/*
	if (window.event)
		key = window.event.keyCode;
	else if (e)
		key = e.which;
	*/	
//	alert(key);
	if(e.shiftKey){
		if(navigator.appName!="Microsoft Internet Explorer") {
			e.cancel=true;
			e.preventDefault();
			return false;
		}
		else{
			e.returnValue=false;
		}
	}
//	8-bksp, 9-tab, 13-ent, 35-end, 36-home, 37-ltar, 39-rtar and single quote, 45-minus, 46-dot and delete, 48 to 57-zero to nine,
	else if((key==8 || key==9 || key==13 || key==35 || key==36 || key==37) || (key >= 48 && key <= 57)) {
		e.returnValue = true;
	}
	else{
		if(navigator.appName!="Microsoft Internet Explorer") {
			e.cancel=true;
			e.preventDefault();
			return false;
		}
		else {
			e.returnValue=false;
		}
	}
}
function allowNumericValues(event){
 var key;
 if(navigator.appName!="Microsoft Internet Explorer") {
 	key=event.which;
 } else {
 		event=window.event;
		key=event.keyCode;
 }
 if(event.shiftKey){
 	if(navigator.appName!="Microsoft Internet Explorer") {
		if(navigator.appName=="Opera"){
			alert("Please enter the numeric values");
		}
		event.cancel=true;
		event.preventDefault();
		return false;
	} 
	else{
		event.returnValue=false;
	}	
  }
  else if( (key==45 || key==46 || key==8 || key==9 || key==13) ||
  	  (key>=33 && key<=40) ||
      (key >= 48 && key <= 57) || (key >= 96 && key <= 105) ) {
	  event.returnValue = true; 
  } 
  else if(event.altKey && key==18){
  	alert("Please Enter the Numeric Value !");
  }
  else{
    if(navigator.appName!="Microsoft Internet Explorer") {
		if(navigator.appName=="Opera"){
			alert("Please enter the numeric values");
		}
		event.cancel=true;
		event.preventDefault();
		return false;
	} 
	else {
		event.returnValue=false;
	}	
  }
}

function allowNumeric(){
  if(event.shiftKey){
  	event.returnValue = false;
  }
  else if( (event.keyCode==45 || event.keyCode==46 || event.keyCode==8 || event.keyCode==9) ||
  	  (event.keyCode>=33 && event.keyCode<=40) ||
      (event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105) ) {
	  event.returnValue = true; 
  }
  else{
    event.returnValue = false;
  }
}
function checkNumber(obj,integral){
	obj.value = Trim(obj.value);
	var length = obj.value.length;
	var matchingArray = obj.value.split("\.");
	if(matchingArray.length == 1){
		if(length > integral){
			return false;
		}
		if(integral == 3){
			if(parseFloat(obj.value) > 100){
				return false;
			}
		}
	}
	else if(matchingArray.length > 2){
		return false;
	}
	else{
		if(obj.value == "."){
			return false;
		}
		var str = obj.value.substring(0,obj.value.indexOf("."));
		if(integral == 3){
			if(parseFloat(str) > 100){
				return false;
			}
		}
		var integralLength = str.length;//alert(integralLength+" "+integral);
		if(integralLength > integral){
			return false;
		}
	}
	return true;
}
function checkLength(len)
{
	if(event.keyCode != 8 && event.keyCode != 16 && event.keyCode != 35 && event.keyCode != 36 && event.keyCode != 37 &&
		event.keyCode != 38 && event.keyCode != 39 && event.keyCode != 40 && event.keyCode != 46)
	{
		var obj = event.srcElement;
		if(obj.value.length >= len)
			event.returnValue=false;
	}
}

//check Phone No. + - 0-9 
function checkPhone(){
 if(event.shiftKey){
  	if(event.keyCode==187)
  		event.returnValue = true;
  	else
  		event.returnValue = false;	
  }
  else if( (event.keyCode==32 || event.keyCode==107 || event.keyCode==109 || event.keyCode==189 || event.keyCode==45 || event.keyCode==46 || event.keyCode==8 || event.keyCode==9) ||
  	  (event.keyCode>=33 && event.keyCode<=40) ||
      (event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105) ) {
	  event.returnValue = true; 
  }
  else{
    event.returnValue = false;
  }
}
function checkUrl(theUrl){
  	if(theUrl.match(/^(http|ftp|mailto)\:\/\/\w+([\.\-]\w+)*\.\w{2,4}(\:\d+)*([\/\.\-\?\&\%]\w+)*\/?$/i)){
   		return true;
 	}else {
   		return false;
  	}
}
function encodeAmp(str){
//	to change special symbols
	var pls = /\+/g;
	str = escape(str);
	str = str.replace(pls,"%2B");
	return str;
}
function checkNumberDate(){
 if(event.shiftKey){
  	if(event.keyCode==187)
  		event.returnValue = true;
  	else
  		event.returnValue = false;	
  }
  else if((event.keyCode==109 || event.keyCode==189 || event.keyCode==45 || event.keyCode==46 || event.keyCode==8 || event.keyCode==9) ||
  	  (event.keyCode>=33 && event.keyCode<=40) ||
      (event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105) ) {
	  event.returnValue = true; 
  }
  else{
    event.returnValue = false;
  }
}
function changeUpper(){
	var slab = Trim(document.form1.slabName.value.toUpperCase());
	document.form1.slabName.value=slab;
}
function checkEscapeSequenceExist(objValue){ 
	var iChars = "!#$%^&*()+=-[]\\\';,/{}|\":<>?";
   	for(var i = 0; i < objValue.length; i++) {
     		if (iChars.indexOf(objValue.charAt(i)) != -1) {
         		return true;
     		}
   	}
   	return false;
}
function checkQuots(objValue){
	var iChars = "\'\"";
   	for(var i = 0; i < objValue.length; i++) {
     		if (iChars.indexOf(objValue.charAt(i)) != -1) {
         		return true;
     		}
   	}
   	return false;
}
function checkEscapeSequenceForListItems(objValue){ 
	var iChars = "%&=_\\\'/\":?";
   	for(var i = 0; i < objValue.length; i++) {
     		if (iChars.indexOf(objValue.charAt(i)) != -1) {
         		return true;
     		}
   	}
   	return false;
}
function checkEscape(objValue){ 
	var iChars = "&\\\'\";";
   	for(var i = 0; i < objValue.length; i++) {
     		if (iChars.indexOf(objValue.charAt(i)) != -1) {
         		return true;
     		}
   	}
   	return false;
}
function checkUsPhoneNumber(ph1,ph2,ph3,phoneNumber){
	ph1.value=Trim(ph1.value);
	ph2.value=Trim(ph2.value);
	ph3.value=Trim(ph3.value);
	
	phoneNumber.value=ph1.value;
	phoneNumber.value+=ph2.value;
	phoneNumber.value+=ph3.value;
	if(phoneNumber.value.length!=10){
		return false;
	}
	var regex=/\d{10}/;
	if(!regex.test(phoneNumber.value)){
		return false;
	}
	return true;
}
function setUsPhoneNumberBlank(ph1,ph2,ph3,phoneNumber){
	ph1.value=Trim(ph1.value);
	ph2.value=Trim(ph2.value);
	ph3.value=Trim(ph3.value);
	
	phoneNumber.value=ph1.value;
	phoneNumber.value+=ph2.value;
	phoneNumber.value+=ph3.value;
}
function checkCurrencyValue(obj)
{
	var regExp = /(^(\d{1,8}|\d{1,8})$)|(^(\d{1,2},\d{3},\d{3})$)|(^(\d{1,3},\d{3})$)|(^(\$\d{1,8}|\d{1,8})$)|(^(\$\d{1,2},\d{3},\d{3})$)|(^(\$\d{1,3},\d{3})$)/;
	if(regExp.test(obj.value))
		return true;
	return false;
}
function checkCurrencyRange(low, high)
{
	if((low.value=="" && high.value!="") || (low.value!="" && high.value==""))
		return false;
	var lower=low.value;
	var higher=high.value;
	var commaRegExp = /,/g;
	lower=lower.replace("$","");
	lower=lower.replace(commaRegExp,"");
	higher=higher.replace("$","");
	higher=higher.replace(commaRegExp,"");
	if(parseInt(lower, 10) > parseInt(higher, 10))
		return false;
	return true;
}

function setPhoneFieldCursor(field,field1,intpart){
	if(field.value.length==intpart)
		field1.focus();
}
function checkOnlyAlphabets(str)
{
/*
	This function is used to enter only alphabets characters and spaces where str is value passed by function.
	This function should be called from validation function at the time of submit.
*/
	re = /^[A-Za-z\s]+$/;
	if(re.test(str))
	{
		return true;
	}
	else
	{
		return false;
	}
}