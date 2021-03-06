:- module(load, []).
/** <module> Load this to start the production environment

*/

%
%  For uses who clone the contentteam project into the same directory as
%  the parent of this project this 'just works'. If your backend is
%  elsewhere, you need to run once, which will break, then do this at
%  top level ?- set_setting(backend_location, 'path/to/my/backend'). ?-
%  save_settings().
%
%  DO NOT check in settings.db
%
:- setting(backend_location, atom, '../contentteam' , 'Location of backend code').

:- load_settings('settings.db').

user:file_search_path(backend, Location) :-
	setting(load:backend_location, Location).

% A bit of possibly excessive abstraction, we load the
% server but don't run it in expertsystem.pl
:-use_module(strangeloop).
% make sure the handlers get loaded
:- ensure_loaded(html_handlers).
:- ensure_loaded(resourcedemo).
:- ensure_loaded(static_handlers).
:- ensure_loaded(style).
:- ensure_loaded(taken).
:- ensure_loaded(library(http/http_session)).








