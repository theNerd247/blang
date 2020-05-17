module Imports where

import Relude (FilePath, Text, LText, Show)
import Polysemy
import Data.Types

-- | Effect for executing an import provided a URI Imports are pure in the
-- language is an interop with the parser.
data Import m a where
  Import :: URI -> Import m LText

data URI 
  = FilePath FilePath
  | URL Text
  deriving (Show)

data ImportError 
  = URINotFound URI
  deriving (Show)

-- TODO: author
-- This should fail if files don't exist
-- runImports :: Members '[Import, Error ImportError] r => Sem (Import ': r) a -> Sem r a
