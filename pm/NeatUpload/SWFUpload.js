
var SWFUpload=function(init_settings){try{document.execCommand('BackgroundImageCache',false,true);}catch(ex){this.debugMessage(ex);}
try{this.settings={};this.movieName="SWFUpload_"+SWFUpload.movieCount++;this.movieElement=null;SWFUpload.instances[this.movieName]=this;this.initSettings(init_settings);this.loadFlash();if(this.debug_enabled){this.displayDebugInfo();}}catch(ex){this.debugMessage(ex);}};SWFUpload.instances={};SWFUpload.movieCount=0;SWFUpload.ERROR_CODE_HTTP_ERROR=-10;SWFUpload.ERROR_CODE_MISSING_UPLOAD_TARGET=-20;SWFUpload.ERROR_CODE_IO_ERROR=-30;SWFUpload.ERROR_CODE_SECURITY_ERROR=-40;SWFUpload.ERROR_CODE_FILE_EXCEEDS_SIZE_LIMIT=-50;SWFUpload.ERROR_CODE_ZERO_BYTE_FILE=-60;SWFUpload.ERROR_CODE_UPLOAD_LIMIT_EXCEEDED=-70;SWFUpload.ERROR_CODE_UPLOAD_FAILED=-80;SWFUpload.ERROR_CODE_QUEUE_LIMIT_EXCEEDED=-90;SWFUpload.ERROR_CODE_SPECIFIED_FILE_NOT_FOUND=-100;SWFUpload.prototype.initSettings=function(init_settings){this.addSetting("control_id",this.movieName,"");this.addSetting("ui_function",init_settings.ui_function,null);this.addSetting("ui_container_id",init_settings.ui_container_id,"");this.addSetting("degraded_container_id",init_settings.degraded_container_id,"");this.addSetting("upload_target_url",init_settings.upload_target_url,"");this.addSetting("upload_cookies",init_settings.upload_cookies,[]);this.addSetting("upload_params",init_settings.upload_params,{});this.addSetting("begin_upload_on_queue",init_settings.begin_upload_on_queue,true);this.addSetting("file_types",init_settings.file_types,"*.gif;*.jpg;*.png");this.addSetting("file_types_description",init_settings.file_types_description,"Common Web Image Formats (gif, jpg, png)");this.addSetting("file_size_limit",init_settings.file_size_limit,"1024");this.addSetting("file_upload_limit",init_settings.file_upload_limit,"0");this.addSetting("file_queue_limit",init_settings.file_queue_limit,"0");this.addSetting("flash_url",init_settings.flash_url,"swfupload.swf");this.addSetting("flash_container_id",init_settings.flash_container_id,"");this.addSetting("flash_width",init_settings.flash_width,"1px");this.addSetting("flash_height",init_settings.flash_height,"1px");this.addSetting("flash_color",init_settings.flash_color,"#FFFFFF");this.addSetting("debug_enabled",init_settings.debug,false);this.debug_enabled=this.getSetting("debug_enabled");this.flashReady=this.retrieveSetting(init_settings.flash_ready_handler,this.flashReady);this.dialogCancelled=this.retrieveSetting(init_settings.dialog_cancelled_handler,this.dialogCancelled);this.fileQueued=this.retrieveSetting(init_settings.file_queued_handler,this.fileQueued);this.fileProgress=this.retrieveSetting(init_settings.file_progress_handler,this.fileProgress);this.fileCancelled=this.retrieveSetting(init_settings.file_cancelled_handler,this.fileCancelled);this.fileComplete=this.retrieveSetting(init_settings.file_complete_handler,this.fileComplete);this.queueStopped=this.retrieveSetting(init_settings.queue_stopped_handler,this.queueStopped);this.queueComplete=this.retrieveSetting(init_settings.queue_complete_handler,this.queueComplete);this.error=this.retrieveSetting(init_settings.error_handler,this.error);this.debug=this.retrieveSetting(init_settings.debug_handler,this.debug);};SWFUpload.prototype.loadFlash=function(){var html,container,target_element,flash_container_id;html=this.getFlashHTML();container=document.createElement("div");container.style.width=this.getSetting("flash_width");container.style.height=this.getSetting("flash_height");flash_container_id=this.getSetting("flash_container_id");if(flash_container_id!==""){target_element=document.getElementById(flash_container_id);}
if(typeof(target_element)==="undefined"||target_element===null){target_element=document.getElementsByTagName("body")[0];}
if(typeof(target_element)==="undefined"||target_element===null){this.debugMessage("Could not find an element to add the Flash too. Failed to find element for \"flash_container_id\" or the BODY element.");return false;}
target_element.appendChild(container);container.innerHTML=html;this.movieElement=document.getElementById(this.movieName);if(typeof(window[this.movieName])==="undefined"||window[this.movieName]!==this.movieElement){window[this.movieName]=this.movieElement;}};SWFUpload.prototype.getFlashHTML=function(){var html="";if(navigator.plugins&&navigator.mimeTypes&&navigator.mimeTypes.length){html='<embed type="application/x-shockwave-flash" src="'+this.getSetting("flash_url")+'" width="'+this.getSetting("flash_width")+'" height="'+this.getSetting("flash_height")+'"';html+=' id="'+this.movieName+'" name="'+this.movieName+'" ';html+=' allowScriptAccess="always" ';html+='bgcolor="'+this.getSetting("flash_color")+'" quality="high" menu="false" flashvars="';html+=this.getFlashVars();html+='" />';}else{html='<object id="'+this.movieName+'" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="'+this.getSetting("flash_width")+'" height="'+this.getSetting("flash_height")+'">';html+='<param name="movie" value="'+this.getSetting("flash_url")+'">';html+='<param name="bgcolor" value="'+this.getSetting("flash_color")+'" />';html+='<param name="quality" value="high" />';html+='<param name="menu" value="false" />';html+='<param name="wmode" value="transparent" />';html+='<param name="allowScriptAccess" value="always" />';html+='<param name="flashvars" value="';html+=this.getFlashVars();html+='" /></object>';}
return html;};SWFUpload.prototype.getFlashVars=function(){var upload_target_url=this.getSetting("upload_target_url");var query_string=this.buildQueryString();var html="";html+="controlID="+encodeURIComponent(this.getSetting("control_id"));html+="&uploadTargetURL="+encodeURIComponent(upload_target_url);html+="&uploadQueryString="+encodeURIComponent(query_string);html+="&beginUploadOnQueue="+encodeURIComponent(this.getSetting("begin_upload_on_queue"));html+="&fileTypes="+encodeURIComponent(this.getSetting("file_types"));html+="&fileTypesDescription="+encodeURIComponent(this.getSetting("file_types_description"));html+="&fileSizeLimit="+encodeURIComponent(this.getSetting("file_size_limit"));html+="&fileUploadLimit="+encodeURIComponent(this.getSetting("file_upload_limit"));html+="&fileQueueLimit="+encodeURIComponent(this.getSetting("file_queue_limit"));html+="&debugEnabled="+encodeURIComponent(this.getSetting("debug_enabled"));return html;};SWFUpload.prototype.buildQueryString=function(){var upload_cookies=this.getSetting("upload_cookies");var upload_params=this.getSetting("upload_params");var query_string_pairs=[];var i,value,name;if(typeof(upload_cookies)==="object"&&typeof(upload_cookies.length)==="number"){for(i=0;i<upload_cookies.length;i++){if(typeof(upload_cookies[i])==="string"&&upload_cookies[i]!==""){value=this.getCookie(upload_cookies[i]);if(value!==""){query_string_pairs.push(encodeURIComponent(upload_cookies[i])+"="+encodeURIComponent(value));}}}}
if(typeof(upload_params)==="object"){for(name in upload_params){if(upload_params.hasOwnProperty(name)){if(typeof(upload_params[name])==="string"){query_string_pairs.push(encodeURIComponent(name)+"="+encodeURIComponent(upload_params[name]));}}}}
return query_string_pairs.join("&");};SWFUpload.prototype.showUI=function(){var ui_container_id,ui_target,degraded_container_id,degraded_target;try{ui_container_id=this.getSetting("ui_container_id");if(ui_container_id!==""){ui_target=document.getElementById(ui_container_id);if(ui_target!==null){ui_target.style.display="block";degraded_container_id=this.getSetting("degraded_container_id");if(degraded_container_id!==""){degraded_target=document.getElementById(degraded_container_id);if(degraded_target!==null){degraded_target.style.display="none";}}}}}catch(ex){this.debugMessage(ex);}};SWFUpload.prototype.addSetting=function(name,value,default_value){if(typeof(value)==="undefined"||value===null){this.settings[name]=default_value;}else{this.settings[name]=value;}
return this.settings[name];};SWFUpload.prototype.getSetting=function(name){if(typeof(this.settings[name])==="undefined"){return"";}else{return this.settings[name];}};SWFUpload.prototype.retrieveSetting=function(value,default_value){if(typeof(value)==="undefined"||value===null){return default_value;}else{return value;}};SWFUpload.prototype.displayDebugInfo=function(){var key,debug_message="";debug_message+="----- DEBUG OUTPUT ----\nID: "+this.movieElement.id+"\n";for(key in this.settings){if(this.settings.hasOwnProperty(key)){debug_message+=key+": "+this.settings[key]+"\n";}}
debug_message+="----- DEBUG OUTPUT END ----\n";debug_message+="\n";this.debugMessage(debug_message);};SWFUpload.prototype.setUploadTargetURL=function(url){if(typeof(url)==="string"){return this.addSetting("upload_target_url",url,"");}else{return false;}};SWFUpload.prototype.setUploadCookies=function(cookie_name_array){if(typeof(cookie_name_array)==="object"&&typeof(cookie_name_array.length)==="number"){return this.addSetting("upload_cookies",cookie_name_array,[]);}else{return false;}};SWFUpload.prototype.setUploadParams=function(param_object){if(typeof(param_object)==="object"){return this.addSetting("upload_params",param_object,[]);}else{return false;}};SWFUpload.prototype.browse=function(){if(typeof(this.movieElement)!=="undefined"&&typeof(this.movieElement.Browse)==="function"){try{this.movieElement.Browse();}
catch(ex){this.debugMessage("Could not call browse: "+ex);}}else{this.debugMessage("Could not find Flash element");}};SWFUpload.prototype.startUpload=function(file_id){if(typeof(this.movieElement)!=="undefined"&&typeof(this.movieElement.StartUpload)==="function"){try{this.movieElement.StartUpload(file_id);}
catch(ex){this.debugMessage("Could not call StartUpload: "+ex);}}else{this.debugMessage("Could not find Flash element");}};SWFUpload.prototype.cancelUpload=function(file_id){if(typeof(this.movieElement)!=="undefined"&&typeof(this.movieElement.CancelUpload)==="function"){try{this.movieElement.CancelUpload(file_id);}
catch(ex){this.debugMessage("Could not call CancelUpload");}}else{this.debugMessage("Could not find Flash element");}};SWFUpload.prototype.cancelQueue=function(){if(typeof(this.movieElement)!=="undefined"&&typeof(this.movieElement.CancelQueue)==="function"){try{this.movieElement.CancelQueue();}
catch(ex){this.debugMessage("Could not call CancelQueue");}}else{this.debugMessage("Could not find Flash element");}};SWFUpload.prototype.stopUpload=function(){if(typeof(this.movieElement)!=="undefined"&&typeof(this.movieElement.StopUpload)==="function"){try{this.movieElement.StopUpload();}
catch(ex){this.debugMessage("Could not call StopUpload");}}else{this.debugMessage("Could not find Flash element");}};SWFUpload.prototype.updateUploadStrings=function(){if(typeof(this.movieElement)!=="undefined"&&typeof(this.movieElement.SetUploadStrings)==="function"){try{this.movieElement.SetUploadStrings(this.getSetting("upload_target_url"),this.buildQueryString());}
catch(ex){this.debugMessage("Could not call SetUploadStrings");}}else{this.debugMessage("Could not find Flash element");}};SWFUpload.prototype.addFileParam=function(file_id,name,value){if(typeof(this.movieElement)!=="undefined"&&typeof(this.movieElement.AddFileParam)==="function"){try{return this.movieElement.AddFileParam(file_id,encodeURIComponent(name),encodeURIComponent(value));}
catch(ex){this.debugMessage("Could not call addFileParam");}}else{this.debugMessage("Could not find Flash element");}};SWFUpload.prototype.removeFileParam=function(file_id,name){if(typeof(this.movieElement)!=="undefined"&&typeof(this.movieElement.RemoveFileParam)==="function"){try{return this.movieElement.RemoveFileParam(file_id,encodeURIComponent(name));}
catch(ex){this.debugMessage("Could not call addFileParam");}}else{this.debugMessage("Could not find Flash element");}};SWFUpload.prototype.flashReady=function(){var ui_function;try{this.debugMessage("Flash called back and is ready.");ui_function=this.getSetting("ui_function");if(typeof(ui_function)==="function"){ui_function.apply(this);}else{this.showUI();}}catch(ex){this.debugMessage(ex);}};SWFUpload.prototype.dialogCancelled=function(){this.debugMessage("browse Dialog Cancelled.");};SWFUpload.prototype.fileQueued=function(file){this.debugMessage("File Queued: "+file.id);};SWFUpload.prototype.fileProgress=function(file,bytes_complete){this.debugMessage("File Progress: "+file.id+", Bytes: "+bytes_complete);};SWFUpload.prototype.fileCancelled=function(file){this.debugMessage("File Cancelled: "+file.id);};SWFUpload.prototype.fileComplete=function(file){this.debugMessage("File Complete: "+file.id);};SWFUpload.prototype.queueComplete=function(file_upload_count){this.debugMessage("Queue Complete. Files Uploaded:"+file_upload_count);};SWFUpload.prototype.queueStopped=function(file){this.debugMessage("Queue Stopped. File Stopped:"+file.id);};SWFUpload.prototype.debug=function(message){this.debugMessage(message);};SWFUpload.prototype.error=function(errcode,file,msg){try{switch(errcode){case SWFUpload.ERROR_CODE_HTTP_ERROR:this.debugMessage("Error Code: HTTP Error, File name: "+file.name+", Message: "+msg);break;case SWFUpload.ERROR_CODE_MISSING_UPLOAD_TARGET:this.debugMessage("Error Code: No backend file, File name: "+file.name+", Message: "+msg);break;case SWFUpload.ERROR_CODE_IO_ERROR:this.debugMessage("Error Code: IO Error, File name: "+file.name+", Message: "+msg);break;case SWFUpload.ERROR_CODE_SECURITY_ERROR:this.debugMessage("Error Code: Security Error, File name: "+file.name+", Message: "+msg);break;case SWFUpload.ERROR_CODE_FILE_EXCEEDS_SIZE_LIMIT:this.debugMessage("Error Code: File too big, File name: "+file.name+", File size: "+file.size+", Message: "+msg);break;case SWFUpload.ERROR_CODE_ZERO_BYTE_FILE:this.debugMessage("Error Code: Zero Byte File, File name: "+file.name+", File size: "+file.size+", Message: "+msg);break;case SWFUpload.ERROR_CODE_UPLOAD_LIMIT_EXCEEDED:this.debugMessage("Error Code: Upload limit reached, File name: "+file.name+", File size: "+file.size+", Message: "+msg);break;case SWFUpload.ERROR_CODE_QUEUE_LIMIT_EXCEEDED:this.debugMessage("Error Code: Upload limit reached, File name: "+file.name+", File size: "+file.size+", Message: "+msg);break;case SWFUpload.ERROR_CODE_UPLOAD_FAILED:this.debugMessage("Error Code: Upload Initialization exception, File name: "+file.name+", File size: "+file.size+", Message: "+msg);break;case SWFUpload.ERROR_CODE_SPECIFIED_FILE_NOT_FOUND:this.debugMessage("Error Code: File ID specified for upload was not found, Message: "+msg);break;default:this.debugMessage("Error Code: Unhandled error occured. Errorcode: "+errcode);}}catch(ex){this.debugMessage(ex);}};SWFUpload.prototype.getCookie=function(cookie_name){var cookie_start,cookie_end;try{if(document.cookie.length>0&&cookie_name!=="")
{cookie_start=document.cookie.indexOf(cookie_name+"=");if(cookie_start!==-1)
{cookie_start=cookie_start+cookie_name.length+1;cookie_end=document.cookie.indexOf(";",cookie_start);if(cookie_end===-1){cookie_end=document.cookie.length;}
return unescape(document.cookie.substring(cookie_start,cookie_end));}}}catch(ex){this.debugMessage(ex);}
return"";};SWFUpload.prototype.debugMessage=function(message){var exception_message,exception_values;if(this.debug_enabled){if(typeof(message)==="object"&&typeof(message.name)==="string"&&typeof(message.message)==="string"){exception_message="";exception_values=[];for(var key in message){exception_values.push(key+": "+message[key]);}
exception_message=exception_values.join("\n");exception_values=exception_message.split("\n");exception_message="EXCEPTION: "+exception_values.join("\nEXCEPTION: ");SWFUpload.Console.writeLine(exception_message);}else{SWFUpload.Console.writeLine(message);}}};SWFUpload.Console={};SWFUpload.Console.writeLine=function(message){var console,documentForm;try{console=document.getElementById("SWFUpload_Console");if(!console){documentForm=document.createElement("form");document.getElementsByTagName("body")[0].appendChild(documentForm);console=document.createElement("textarea");console.id="SWFUpload_Console";console.style.fontFamily="monospace";console.setAttribute("wrap","off");console.wrap="off";console.style.overflow="auto";console.style.width="700px";console.style.height="350px";console.style.margin="5px";documentForm.appendChild(console);}
console.value+=message+"\n";console.scrollTop=console.scrollHeight-console.clientHeight;}catch(ex){alert("Exception: "+ex.name+" Message: "+ex.message);}};