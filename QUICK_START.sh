#!/bin/bash

echo "🚀 CodeFlow AI - Quick Start Script"
echo "===================================="
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+ first."
    echo "   Visit: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js version: $(node -v)"

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed."
    exit 1
fi

echo "✅ npm version: $(npm -v)"
echo ""

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Check if .env exists
if [ ! -f .env ]; then
    echo ""
    echo "⚠️  No .env file found. Creating from .env.example..."
    cp .env.example .env
    echo "✅ Created .env file"
    echo ""
    echo "⚠️  IMPORTANT: Edit .env file with your credentials:"
    echo "   - MONGODB_URI (MongoDB connection string)"
    echo "   - JWT_SECRET (random 32+ character string)"
    echo "   - ANTHROPIC_API_KEY (from console.anthropic.com)"
    echo ""
    echo "Press Enter after you've configured .env..."
    read
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "To start the application:"
echo "  npm run dev      # Start both frontend and backend"
echo ""
echo "Or run them separately:"
echo "  npm run dev:client   # Frontend only (port 3000)"
echo "  npm run dev:server   # Backend only (port 5000)"
echo ""
echo "📚 For more information, see README.md"
echo ""
