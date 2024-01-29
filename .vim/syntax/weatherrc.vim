" Vim syntax file
" Program:         weather utils (https://fungi.yuggoth.org/weather/)
" Version:         weather 2.2.4
" Author:          Michael DeBusk (https://gitlab.com/mdebusk)
" Maintainer:      Michael DeBusk (https://gitlab.com/mdebusk)
" Latest Revision: 2024-01-29 15:54

if exists("b:current_syntax")
    finish
endif

" Case insensitive
syntax case ignore

syntax region  weatherLabel    start="^\s*\[" end="\]"

syntax match   weatherComment  "[#;].*$"

syntax match   weatherInt      "\d\+"

syntax match   weatherURL      /https\?:\/\/tgftp\.nws\.noaa\.gov\/data\/.*\.[Tt][Xx][Tt]$/

" TODO: I haven't figured out how to make this match a file path
"" syntax match   weatherPath     "\~\/\.*$"

syntax keyword weatherHeaders  heat_index precipitation_last_hour
syntax keyword weatherHeaders  relative_humidity sky_conditions temperature
syntax keyword weatherHeaders  weather wind windchill

syntax keyword weatherKeywords1 alert cache cache_data nextgroup=weatherBoolean
syntax keyword weatherKeywords1 cache_search conditions nextgroup=weatherBoolean
syntax keyword weatherKeywords1 forecast imperial metric nextgroup=weatherBoolean
syntax keyword weatherKeywords1 quiet verbose nextgroup=weatherBoolean

syntax keyword weatherKeywords2 atypes cacheage cachedir defargs description
syntax keyword weatherKeywords2 headers setpath

syntax keyword weatherKeywords3 metar zone_forecast nextgroup=weatherURL

syntax keyword weatherKeywords4 cacheage nextgroup=weatherInt

" TODO: When fixing the regex on line 22, this will be useful
"" syntax keyword weatherKeywords5 cachedir setpath nextgroup=weatherPath
syntax keyword weatherKeywords5 cachedir setpath

syntax keyword weatherAtypes   coastal_flood_statement flash_flood_statement
syntax keyword weatherAtypes   flash_flood_warning flash_flood_watch
syntax keyword weatherAtypes   flood_statement flood_warning
syntax keyword weatherAtypes   severe_thunderstorm_warning severe_weather_statement
syntax keyword weatherAtypes   special_weather_statement tornado_warning
syntax keyword weatherAtypes   urgent_weather_message

syntax keyword weatherBool     true false

highlight def link weatherLabel     Identifier
highlight def link weatherHeaders   Special
highlight def link weatherComment   Comment
highlight def link weatherKeywords1 Keyword
highlight def link weatherKeywords2 Keyword
highlight def link weatherKeywords3 Keyword
highlight def link weatherKeywords4 Keyword
highlight def link weatherKeywords5 Keyword
highlight def link weatherAtypes    Error
highlight def link weatherBool      Boolean
highlight def link weatherURL       Underlined
highlight def link weatherInt       Number
" TODO: When fixing the regex on line 22, this will be useful
"" highlight def link weatherPath      String


let b:current_syntax = "weatherrc"
