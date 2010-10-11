// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function updatedStatus(authenticity_token) {
	//new Effect.Highlight(element, {startcolor: this.options.highlightcolor});
	var pars = 'authenticity_token=' + encodeURIComponent(authenticity_token);
	new Ajax.Updater('everyone', '/refresh_everyone', {asynchronous:false, parameters:pars});
	new Ajax.Updater('timeline', '/refresh_timeline', {asynchronous:false, parameters:pars});
}
