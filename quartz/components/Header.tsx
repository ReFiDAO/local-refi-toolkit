import { QuartzComponentConstructor, QuartzComponentProps } from "./types"
import { pathToRoot, joinSegments } from "../util/path"

// Preact hooks (instead of React)
import { useCallback, useEffect, useState } from "preact/hooks"

interface Options {
  title?: string
  links?: Record<string, string>
}

// This is the correct pattern for Quartz components
const Header: QuartzComponentConstructor<Options> = (opts) => {
  const title = opts?.title ?? "Local ReFi Toolkit 🌱"
  const links = opts?.links ?? {
    Introduction: "/introduction",
    Library: "/library",
    Resources: "/resources",
  }

  // This inner function is what gets called during rendering
  function HeaderComponent(props: QuartzComponentProps) {
    const { fileData, cfg } = props
    // compute base path to root so the title link works under baseDir
    const baseDir = fileData?.slug ? pathToRoot(fileData.slug) : "/"
    const siteTitle = cfg?.pageTitle ? `${cfg.pageTitle} 🌱` : title
    return (
      <header>
        <div className="container flex h-14 items-center">
          <div className="mr-4 flex">
            <a href={baseDir} className="mr-6 flex items-center space-x-2">
              <p style={{ margin: "0rem" }}>{siteTitle}</p>
            </a>
          </div>
          {/* Desktop inline navigation */}
          <nav className="desktop-nav">
            <a href={baseDir}>Home</a>
            {Object.entries(links).map(([text, href]) => {
              const linkHref = href.startsWith("/") ? href.slice(1) : href
              return (
                <a key={href} href={joinSegments(baseDir, linkHref)}>{text}</a>
              )
            })}
            <a href={joinSegments(baseDir, "introduction/action-kit")}>Action Kit</a>
            <a href={joinSegments(baseDir, "INTERNAL-INDEX")}>Dev Docs</a>
          </nav>

          <div className="flex flex-1 items-center justify-end space-x-2">
            {/* Children (Search) are rendered here */}
            <div className="header-actions">
              {props.children}
            </div>
          </div>

          
        </div>

        
      </header>
    )
  }

  // Add afterDOMLoaded script to the component
  HeaderComponent.afterDOMLoaded = `
    document.addEventListener('DOMContentLoaded', function() {
      // Position the search container correctly with the fixed header
      const searchContainer = document.getElementById('search-container');
      if (searchContainer) {
        searchContainer.style.position = 'fixed';
        searchContainer.style.top = '3.5rem';
      }
    });
  `

  return HeaderComponent
}

export default Header
