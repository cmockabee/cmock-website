{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_web (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/cameronmockabee/Desktop/Repos/cmock-website/web/.stack-work/install/x86_64-osx/ddd1bf5e166f7c1db5556b2178698de4da96b5cd2c04efc33661309c9cd37dd0/8.6.5/bin"
libdir     = "/Users/cameronmockabee/Desktop/Repos/cmock-website/web/.stack-work/install/x86_64-osx/ddd1bf5e166f7c1db5556b2178698de4da96b5cd2c04efc33661309c9cd37dd0/8.6.5/lib/x86_64-osx-ghc-8.6.5/web-0.1.0.0-CizD78K63WnG4imQyVn7XJ-site"
dynlibdir  = "/Users/cameronmockabee/Desktop/Repos/cmock-website/web/.stack-work/install/x86_64-osx/ddd1bf5e166f7c1db5556b2178698de4da96b5cd2c04efc33661309c9cd37dd0/8.6.5/lib/x86_64-osx-ghc-8.6.5"
datadir    = "/Users/cameronmockabee/Desktop/Repos/cmock-website/web/.stack-work/install/x86_64-osx/ddd1bf5e166f7c1db5556b2178698de4da96b5cd2c04efc33661309c9cd37dd0/8.6.5/share/x86_64-osx-ghc-8.6.5/web-0.1.0.0"
libexecdir = "/Users/cameronmockabee/Desktop/Repos/cmock-website/web/.stack-work/install/x86_64-osx/ddd1bf5e166f7c1db5556b2178698de4da96b5cd2c04efc33661309c9cd37dd0/8.6.5/libexec/x86_64-osx-ghc-8.6.5/web-0.1.0.0"
sysconfdir = "/Users/cameronmockabee/Desktop/Repos/cmock-website/web/.stack-work/install/x86_64-osx/ddd1bf5e166f7c1db5556b2178698de4da96b5cd2c04efc33661309c9cd37dd0/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "web_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "web_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "web_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "web_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "web_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "web_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
