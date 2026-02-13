import React, { useState, useEffect } from 'react';

const App = () => {
  const [activeTab, setActiveTab] = useState('');

  useEffect(() => {
    // Set active tab based on current URL path
    const path = window.location.pathname;
    const navItems = [
      { name: 'Home', path: '/home' },
      { name: 'Prefixes', path: '/prefixes' },
      { name: 'Courses', path: '/courses' },
      { name: 'Sections', path: '/sections' },
      { name: 'Students', path: '/students' }
    ];
    
    const active = navItems.find(item => path.startsWith(item.path));
    if (active) {
      setActiveTab(active.name);
    }
  }, []);

  const navItems = [
    { name: 'Home', path: '/home' },
    { name: 'Prefixes', path: '/prefixes' },
    { name: 'Courses', path: '/courses' },
    { name: 'Sections', path: '/sections' },
    { name: 'Students', path: '/students' }
  ];

  const theme = {
    navy: '#002147', 
    red: '#D11242',
    white: '#FFFFFF',
    hover: 'rgba(209, 18, 66, 0.15)'
  };

  return (
    <nav style={{
      background: theme.navy,
      padding: '0',
      boxShadow: '0 4px 12px rgba(0,0,0,0.25)',
      fontFamily: 'system-ui, -apple-system, sans-serif',
      borderBottom: `1px solid ${theme.red}`
    }}>
      <div style={{
        maxWidth: '1400px',
        margin: '0 auto',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        padding: '0 20px',
      }}>
        {/* Logo/Title Section */}
        <div style={{
          display: 'flex',
          alignItems: 'center',
          gap: '12px',
          padding: '16px 0',
        }}>
          <div style={{
            fontSize: '28px',
          }}>
            📚📕📘
          </div>
          <div>
            <h1 style={{
              margin: 0,
              fontSize: '20px',
              fontWeight: '700',
              color: 'white',
              letterSpacing: '-0.3px',
            }}>
              Course Management System
            </h1>
            <p style={{
              margin: 0,
              fontSize: '12px',
              color: 'rgba(255,255,255,0.7)',
            }}>
              CS3710 Final Project
            </p>
          </div>
        </div>

        {/* Navigation Links */}
        <div style={{
          display: 'flex',
          gap: '4px',
          alignItems: 'center',
        }}>
          {navItems.map((item) => (
            <a
              key={item.name}
              href={item.path}
              style={{
                color: 'white',
                textDecoration: 'none',
                padding: '28px 24px',
                fontSize: '15px',
                fontWeight: '500',
                transition: 'all 0.2s ease',
                borderBottom: activeTab === item.name ? `4px solid ${theme.red}` : '4px solid transparent',
                background: activeTab === item.name ? 'rgba(0,0,0,0.2)' : 'transparent',
                cursor: 'pointer',
              }}
              onMouseEnter={(e) => {
                if (activeTab !== item.name) {
                  e.currentTarget.style.background = theme.hover;
                }
              }}
              onMouseLeave={(e) => {
                if (activeTab !== item.name) {
                  e.currentTarget.style.background = 'transparent';
                }
              }}
              onMouseDown={() => {
                setActiveTab(item.name);
              }}
            >
              {item.name}
            </a>
          ))}
        </div>

        {/* Right side info */}
        <div style={{
          display: 'flex',
          alignItems: 'center',
          gap: '12px',
          color: 'white',
          fontSize: '13px',
        }}>
          <div style={{
            padding: '8px 16px',
            background: theme.red,
            borderRadius: '4px',
            fontWeight: '600',
            boxShadow: '0 2px 4px rgba(0,0,0,0.2)'
          }}>
            By Momen Suliman
          </div>
        </div>
      </div>
    </nav>
  );
};

export default App;