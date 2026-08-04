import React, { useState, useEffect } from "react";

const App = () => {
  const [activeTab, setActiveTab] = useState("");
  const [isMobile, setIsMobile] = useState(false);

  useEffect(() => {
    const path = window.location.pathname;
    const navItems = [
      { name: "Home", path: "/home" },
      { name: "Prefixes", path: "/prefixes" },
      { name: "Courses", path: "/courses" },
      { name: "Sections", path: "/sections" },
      { name: "Students", path: "/students" },
    ];

    const active = navItems.find((item) => path.startsWith(item.path));
    if (active) {
      setActiveTab(active.name);
    }

    const handleResize = () => setIsMobile(window.innerWidth < 768);
    handleResize();
    window.addEventListener("resize", handleResize);

    return () => window.removeEventListener("resize", handleResize);
  }, []);

  const navItems = [
    { name: "Home", path: "/home" },
    { name: "Prefixes", path: "/prefixes" },
    { name: "Courses", path: "/courses" },
    { name: "Sections", path: "/sections" },
    { name: "Students", path: "/students" },
  ];

  const theme = {
    navy: "#002147",
    navySoft: "#0f3b67",
    red: "#D11242",
    white: "#FFFFFF",
    hover: "rgba(209, 18, 66, 0.15)",
  };

  return (
    <nav
      aria-label="Primary navigation"
      style={{
        background: `linear-gradient(90deg, ${theme.navy} 0%, ${theme.navy} 55%, ${theme.navySoft} 100%)`,
        padding: "0",
        boxShadow: "0 4px 16px rgba(0,0,0,0.22)",
        fontFamily: "system-ui, -apple-system, sans-serif",
        borderBottom: `2px solid ${theme.red}`,
        position: "sticky",
        top: 0,
        zIndex: 1000,
        overflow: "hidden",
      }}
    >
      <div
        style={{
          maxWidth: "1400px",
          margin: "0 auto",
          display: "flex",
          flexDirection: isMobile ? "column" : "row",
          alignItems: isMobile ? "flex-start" : "center",
          justifyContent: isMobile ? "flex-start" : "space-between",
          padding: isMobile ? "14px 16px 16px" : "0 20px",
          gap: isMobile ? "10px" : "0",
        }}
      >
        <div
          style={{
            display: "flex",
            alignItems: "center",
            gap: "12px",
            padding: isMobile ? "0" : "16px 0",
          }}
        >
          <div style={{ fontSize: isMobile ? "24px" : "28px" }}>📚📕📘</div>
          <div>
            <h1
              style={{
                margin: 0,
                fontSize: isMobile ? "17px" : "20px",
                fontWeight: "700",
                color: "white",
                letterSpacing: "-0.3px",
              }}
            >
              Student Management System
            </h1>
            <p
              style={{
                margin: 0,
                fontSize: isMobile ? "11px" : "12px",
                color: "rgba(255,255,255,0.7)",
              }}
            >
              Powered by Ruby On Rails
            </p>
          </div>
        </div>

        <div
          style={{
            display: "flex",
            flexWrap: "wrap",
            gap: "6px",
            alignItems: "center",
            justifyContent: isMobile ? "flex-start" : "center",
          }}
        >
          {navItems.map((item) => {
            const isActive = activeTab === item.name;
            return (
              <a
                key={item.name}
                href={item.path}
                style={{
                  color: "white",
                  textDecoration: "none",
                  padding: isMobile ? "10px 12px" : "28px 24px",
                  fontSize: "15px",
                  fontWeight: "500",
                  transition: "all 0.2s ease",
                  borderBottom: isActive
                    ? `4px solid ${theme.red}`
                    : "4px solid transparent",
                  background: isActive ? "rgba(0,0,0,0.2)" : "transparent",
                  cursor: "pointer",
                  borderRadius: isMobile ? "999px" : "0",
                }}
                onMouseEnter={(e) => {
                  if (!isActive) {
                    e.currentTarget.style.background = theme.hover;
                  }
                }}
                onMouseLeave={(e) => {
                  if (!isActive) {
                    e.currentTarget.style.background = "transparent";
                  }
                }}
                onMouseDown={() => setActiveTab(item.name)}
              >
                {item.name}
              </a>
            );
          })}
        </div>

        <div
          style={{
            display: "flex",
            alignItems: "center",
            gap: "12px",
            color: "white",
            fontSize: "13px",
            marginTop: isMobile ? "4px" : "0",
          }}
        >
          <div
            style={{
              padding: "8px 12px",
              background: theme.red,
              borderRadius: isMobile ? "999px" : "4px",
              fontWeight: "600",
              boxShadow: "0 2px 4px rgba(0,0,0,0.2)",
            }}
          >
            By Momen Suliman
          </div>
        </div>
      </div>
    </nav>
  );
};

export default App;
