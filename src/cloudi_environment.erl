%-*-Mode:erlang;coding:utf-8;tab-width:4;c-basic-offset:4;indent-tabs-mode:()-*-
% ex: set ft=erlang fenc=utf-8 sts=4 ts=4 sw=4 et nomod:
%%%
%%%------------------------------------------------------------------------
%%% @doc
%%% ==CloudI Runtime Environment==
%%% @end
%%%
%%% MIT License
%%%
%%% Copyright (c) 2014-2017 Michael Truog <mjtruog at gmail dot com>
%%%
%%% Permission is hereby granted, free of charge, to any person obtaining a
%%% copy of this software and associated documentation files (the "Software"),
%%% to deal in the Software without restriction, including without limitation
%%% the rights to use, copy, modify, merge, publish, distribute, sublicense,
%%% and/or sell copies of the Software, and to permit persons to whom the
%%% Software is furnished to do so, subject to the following conditions:
%%%
%%% The above copyright notice and this permission notice shall be included in
%%% all copies or substantial portions of the Software.
%%%
%%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%%% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%%% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%%% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%%% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
%%% FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
%%% DEALINGS IN THE SOFTWARE.
%%%
%%% @author Michael Truog <mjtruog [at] gmail (dot) com>
%%% @copyright 2014-2017 Michael Truog
%%% @version 1.7.1 {@date} {@time}
%%%------------------------------------------------------------------------

-module(cloudi_environment).
-author('mjtruog [at] gmail (dot) com').

%% external interface
-export([lookup/0,
         transform/1,
         transform/2]).

-type lookup() :: trie:trie().
-export_type([lookup/0]).

%%%------------------------------------------------------------------------
%%% External interface functions
%%%------------------------------------------------------------------------

%%-------------------------------------------------------------------------
%% @doc
%% ===Get an environment variable lookup.===
%% @end
%%-------------------------------------------------------------------------

-spec lookup() ->
    lookup().

lookup() ->
    cloudi_core_i_spawn:environment_lookup().

%%-------------------------------------------------------------------------
%% @doc
%% ===Transform a string, substituting environment variable values from the lookup.===
%% Use ${VARIABLE} or $VARIABLE syntax, where VARIABLE is a name with
%% [a-zA-Z0-9_] ASCII characters.
%% @end
%%-------------------------------------------------------------------------

-spec transform(String :: string()) ->
    string().

transform(String) ->
    Lookup = lookup(),
    cloudi_core_i_spawn:environment_transform(String, Lookup).

%%-------------------------------------------------------------------------
%% @doc
%% ===Transform a string, substituting environment variable values from the lookup.===
%% Use ${VARIABLE} or $VARIABLE syntax, where VARIABLE is a name with
%% [a-zA-Z0-9_] ASCII characters.
%% @end
%%-------------------------------------------------------------------------

-spec transform(String :: string(),
                Lookup :: lookup()) ->
    string().

transform(String, Lookup) ->
    cloudi_core_i_spawn:environment_transform(String, Lookup).

