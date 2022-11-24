let Person = ./Person.dhall

let Author = ./Author.dhall

let Job = ./Job.dhall

let Link = ./Link.dhall

let NagMessage = ./NagMessage.dhall

let SeriesDescription = ./SeriesDescription.dhall

let Prelude = ../Prelude.dhall

let defaultPort = env:PORT ? 3030

let defaultWebMentionEndpoint =
        env:WEBMENTION_ENDPOINT
      ? "https://mi.within.website/api/webmention/accept"

in  { Type =
        { signalboost : List Person.Type
        , defaultAuthor : Author.Type
        , authors : Prelude.Map.Type Text Author.Type
        , port : Natural
        , clackSet : List Text
        , resumeFname : Text
        , webMentionEndpoint : Text
        , miToken : Text
        , jobHistory : List Job.Type
        , seriesDescriptions : List SeriesDescription.Type
        , seriesDescMap : Prelude.Map.Type Text Text
        , notableProjects : List Link.Type
        , contactLinks : List Link.Type
        }
    , default =
      { signalboost = [] : List Person.Type
      , defaultAuthor = Author::{=}
      , authors = [] : List Author.Type
      , port = defaultPort
      , clackSet = [ "Ashlynn" ]
      , resumeFname = "./static/resume/resume.md"
      , webMentionEndpoint = defaultWebMentionEndpoint
      , miToken = "${env:MI_TOKEN as Text ? ""}"
      , jobHistory = [] : List Job.Type
      , seriesDescriptions = [] : List SeriesDescription.Type
      , seriesDescMap = [] : Prelude.Map.Type Text Text
      , notableProjects = [] : List Link.Type
      , contactLinks = [] : List Link.Type
      }
    }
