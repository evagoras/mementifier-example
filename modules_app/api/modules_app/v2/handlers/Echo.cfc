/**
 * My RESTFul Event Handler which inherits from the module `api` 
 */
component extends="api.handlers.BaseHandler"{
	
	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";		

	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	property name="userDao" inject="UserDao@v2";
	
	/**
	* Index
	*/
	any function index( event, rc, prc ){
		var userResponse = [];
		var users = userDao.getUsers();
		for (var user in users) {
			var userBean = getInstance("User@v2");
			populateModel(model=userBean, memento=user);
			userResponse.append(userBean.getMemento());
		}
		prc.response.setData(userResponse);
	}
	
}