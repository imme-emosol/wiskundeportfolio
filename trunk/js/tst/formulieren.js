/**
Id
	$Id$
Revision of last commit
	$Revision$
Author of last commit
	$Author$
Localized datetime of last modification
	$Date$
HeadURL
	$HeadURL$
**/

//  @TODO: do language clean-up, everything in english or all possible `things` in dutch.
var forms  =  {
	  auteur    :  'immeëmosol'
	, list_id  :  'forms_list'
	, list_heading  :  'Formulierkeuze'
	, elements  :  {
			  'element_1'  :  {
				  description : 'element 1'
				, text  : ''
					+ 'Dit is dus element 1'
				, getContent  :  function () {
					var content  =  document.createElement( 'p' );
					content.appendChild( document.createTextNode( this.text ) );
					return content;
				}
			}
			, 'element_2'  :  {
				  description  :  'element 2'
				, text  : ''
					+ 'Dit is dus element 2'
				, getContent  :  function () {
					var content  =  document.createElement( 'p' );
					content.appendChild( document.createTextNode( this.text ) );
					return content;
				}
			}
		}
	, init    :  function ()
		{
			var list  =  document.createElement( 'ul' );
			var item  =  document.createElement( 'li' );
			var link  =  document.createElement( 'a' );
			item.appendChild( link );

			var items  =  new Array();
			var text;
			for ( var identifier in this.elements )
				{
					items[identifier]  =  item.cloneNode(true);

					items[identifier].childNodes[0].href  =  '#' + encodeURI( identifier );
					//  @TODO: this identifier should be uniqe as well.
					//    second time this comes into play, so useful to create a function that will generate the unique id
					//    does however probably also create a need for a function that will strip the unique-ness part away from the id.
					items[identifier].childNodes[0].id  =  identifier;
					items[identifier].childNodes[0].onclick  =  function ()
						{
							forms.addForm( this.id );
							return false;
						}
					txt  =  document.createTextNode( this.elements[identifier].description );
					items[identifier].childNodes[0].appendChild( txt );
					list.appendChild( items[identifier] );
				}
			list_wrapper  =  document.createElement( 'div' );
			list_wrapper.id  =  this.list_id;
			var list_heading  =  document.createElement( 'h2' );
			list_heading.appendChild( document.createTextNode( this.list_heading ) );
			list_wrapper.appendChild( list_heading );
			list_wrapper.appendChild( list );
			document.body.appendChild( list_wrapper );
		}
	, initForm  :  function ( form_identifier , unique )
		{
			if ( null != unique ) { form_identifier +=  unique; }
			var form  =  document.createElement( 'div' );
			var form_heading  =  document.createElement( 'h2' );
			var form_headingText  =  document.createTextNode( this.elements[ form_identifier ].description );
			form_heading.appendChild( form_headingText );
			form.appendChild( form_heading );
			var form_content  =  this.elements[ form_identifier ].getContent();
			form.appendChild( form_content );
			form.id  =  form_identifier;
			return form;
		}
	, addForm  :  function ( form_identifier )
		{
			//  @TODO: check if a form with this identifier is already added.
			document.body.appendChild(
				this.initForm( form_identifier )
			);
		}
}

window.onload  =  function ()
	{
		forms.init();
	}

