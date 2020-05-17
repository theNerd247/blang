module Parser where

import Data.Types
import Imports
import Polysemy
import Polysemy.Error
import Polysemy.IO
import Relude
import Text.Megaparsec

type Parser s a = Parsec ParserError s a

data ParserError

type MemberParser s r = Member (Embed (Parser s) (MemberImport r)) r

-- parseExpr :: ParserEff r => LText -> Sem r Term
