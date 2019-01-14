Class {
	#name : #CssForLoginMDL,
	#superclass : #WAFileLibrary,
	#category : #'ESUGApp-Library'
}

{ #category : #accessing }
CssForLoginMDL >> esugLoginCss [
	^ '* {
	overflow-x: hidden;
	margin: 0px;
	padding: 0px;
}

body {
	background-image: url(''/files/CssForLoginMDL/profile_city.jpg'');
	background-size: cover;
	background-position: top center;
}

.mdl-card, .mdl-card__supporting-text {
    overflow: inherit !important;
}

#login {
    overflow: visible !important;
    z-index: auto !important;
    margin: auto;

}


#login-fab {
	border-radius: 50%;
    height: 56px;
    margin: auto;
    min-width: 56px;
    width: 56px;
    overflow: hidden;
    background: rgba(158,158,158,.2);
    box-shadow: 0 1px 1.5px 0 rgba(0,0,0,.12), 0 1px 1px 0 rgba(0,0,0,.24);
    position: absolute;
    top: -30px;
    text-align: center;
    left: 0;
    right: 0;
}

#lock-icon{
	line-height: 56px;
}

#login-button {
  width: 100%;
  height: 40px;
  min-width: initial;
}

#card-heading{
	text-align: center;
    font-weight: 600;
    font-size: 32px;
    height: 40px;
    padding-top: 40px;
    color: #092e44
}

#forgotpassword{
	float: right;
}


#footer{
 background-color:transparent;
 color:white
}


@media (max-width: 800px) and (min-width: 300px) {
	#card-heading{
		text-align: center;
	    font-weight: 600;
	    font-size: 25px;
	    height: 40px;
	    padding-top: 40px;
	    color: #092e44
	}
	html, body {
        height: 100%;
        width: 100%;
        padding: 0;
        margin: 0;
    }
}
'
]

{ #category : #uploaded }
CssForLoginMDL >> profilecityJpg [
]

{ #category : #accessing }
CssForLoginMDL >> selectorsToInclude [
	^ Array with: 'profilecityJpg'
]