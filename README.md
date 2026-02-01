# CodeFlow AI - Production-Ready Task Management & AI-Powered Workflow Automation Platform

![CodeFlow AI](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)

A modern, full-stack web application combining powerful task management with advanced AI capabilities powered by Anthropic's Claude AI.

## 🚀 Features

### Core Features
- ✅ **Advanced Task Management** - Create, edit, delete, prioritize tasks with subtasks, due dates, and dependencies
- 📊 **Project Management** - Organize tasks into projects with team collaboration
- 🤖 **AI Integration** (12+ Advanced Features) - Context-aware AI assistant with conversation history
- 📈 **Analytics Dashboard** - Real-time insights with charts and productivity metrics
- 🔔 **Real-time Notifications** - WebSocket-based instant updates
- 👥 **Team Collaboration** - Assign tasks, comment, invite members
- 🎨 **Modern UI/UX** - Responsive design with dark/light mode
- 🔐 **Secure Authentication** - JWT-based auth with bcrypt password hashing

### AI Capabilities (10+ Features)
1. **Interactive Prompt Input** - Natural language conversations
2. **Multi-Turn Conversations** - Contextual dialogue history
3. **Response Formatting** - Tables, lists, code snippets
4. **Error Handling** - Graceful error management
5. **Rate Limiting** - Request queue management
6. **Prompt Suggestions** - AI-powered auto-complete
7. **Logging & Analytics** - Usage tracking and insights
8. **Customizable Output** - Adjust length, style, format
9. **Save & Export** - Download as PDF, TXT, CSV, JSON
10. **Task-Aware Responses** - Project/task context integration
11. **Feedback System** - Rate and improve responses
12. **Conversation Management** - Save, search, delete chats

## 📋 Prerequisites

- **Node.js** 18+ and npm 9+
- **MongoDB** 5.0+ (local or MongoDB Atlas)
- **Anthropic API Key** ([Get one here](https://console.anthropic.com/))

## 🛠️ Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/CodeFlow-ai.git
cd CodeFlow-ai
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Environment Configuration

Create a `.env` file in the root directory:

```bash
cp .env.example .env
```

Edit `.env` with your configuration:

```env
# Server Configuration
PORT=5000
NODE_ENV=development

# Database
MONGODB_URI=mongodb://localhost:27017/codeflow-ai
# Or MongoDB Atlas:
# MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/codeflow-ai

# JWT Secret (Generate a strong random string)
JWT_SECRET=your-super-secret-jwt-key-min-32-characters

# AI Configuration (Anthropic Claude API)
ANTHROPIC_API_KEY=sk-ant-your-api-key-here

# Client URL (for CORS)
CLIENT_URL=http://localhost:3000

# Rate Limiting
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100

# AI Settings
AI_MAX_TOKENS=4000
AI_MODEL=claude-sonnet-4-20250514
```

### 4. Database Setup

#### Option A: Local MongoDB
```bash
# Install MongoDB (if not installed)
# macOS:
brew install mongodb-community

# Start MongoDB
brew services start mongodb-community

# Or Linux:
sudo systemctl start mongod
```

#### Option B: MongoDB Atlas (Cloud)
1. Create account at [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
2. Create a cluster
3. Get connection string and add to `.env`

### 5. Get Anthropic API Key

1. Visit [Anthropic Console](https://console.anthropic.com/)
2. Create an account or sign in
3. Navigate to API Keys
4. Create a new API key
5. Add to `.env` file

## 🚀 Running the Application

### Development Mode

Run both frontend and backend concurrently:

```bash
npm run dev
```

This starts:
- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:5000

### Individual Services

```bash
# Frontend only
npm run dev:client

# Backend only
npm run dev:server
```

### Production Build

```bash
# Build frontend
npm run build

# Start production server
npm start
```

## 🌐 Deployment

### Deploy to Netlify (Recommended)

#### Prerequisites
- Netlify account
- MongoDB Atlas (for production database)
- Anthropic API key

#### Steps:

1. **Build the project:**
```bash
npm run build
```

2. **Deploy via Netlify CLI:**
```bash
# Install Netlify CLI
npm install -g netlify-cli

# Login to Netlify
netlify login

# Initialize site
netlify init

# Deploy
netlify deploy --prod
```

3. **Configure Environment Variables in Netlify:**
   - Go to Site Settings → Environment Variables
   - Add all variables from `.env`:
     - `MONGODB_URI` (MongoDB Atlas connection string)
     - `JWT_SECRET`
     - `ANTHROPIC_API_KEY`
     - `NODE_ENV=production`

4. **Configure Build Settings:**
   - Build command: `npm run build`
   - Publish directory: `dist`
   - Functions directory: `server`

### Alternative Deployments

#### Heroku
```bash
# Install Heroku CLI
npm install -g heroku

# Login
heroku login

# Create app
heroku create codeflow-ai

# Set environment variables
heroku config:set MONGODB_URI=your-mongodb-uri
heroku config:set JWT_SECRET=your-jwt-secret
heroku config:set ANTHROPIC_API_KEY=your-api-key

# Deploy
git push heroku main
```

#### Vercel
```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel --prod
```

#### Railway
1. Push to GitHub
2. Connect repository in Railway
3. Add environment variables
4. Deploy automatically

## 📖 API Documentation

### Authentication Endpoints

#### Register
```http
POST /api/auth/register
Content-Type: application/json

{
  "username": "user123",
  "email": "user@example.com",
  "password": "password123",
  "firstName": "John",
  "lastName": "Doe"
}
```

#### Login
```http
POST /api/auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123"
}
```

### Task Endpoints

#### Get All Tasks
```http
GET /api/tasks
Authorization: Bearer {token}
```

#### Create Task
```http
POST /api/tasks
Authorization: Bearer {token}
Content-Type: application/json

{
  "title": "Task Title",
  "description": "Task description",
  "project": "projectId",
  "priority": "high",
  "dueDate": "2025-02-15T00:00:00Z"
}
```

### AI Endpoints

#### Send Chat Message
```http
POST /api/ai/chat
Authorization: Bearer {token}
Content-Type: application/json

{
  "prompt": "Help me break down this task into subtasks",
  "conversationId": "optional-conversation-id",
  "context": {
    "projectId": "project-id",
    "taskId": "task-id",
    "type": "task-related"
  },
  "settings": {
    "maxTokens": 4000,
    "temperature": 1.0,
    "format": "list"
  }
}
```

#### Get AI Analytics
```http
GET /api/ai/analytics?startDate=2025-01-01&endDate=2025-02-01
Authorization: Bearer {token}
```

#### Export AI Response
```http
GET /api/ai/export/{interactionId}/txt
Authorization: Bearer {token}
```

Formats: `txt`, `json`, `csv`

## 🎯 Usage Guide

### Getting Started

1. **Register an Account**
   - Navigate to `/register`
   - Fill in your details
   - Receive JWT token

2. **Create Your First Project**
   - Click "New Project"
   - Add name, description, and settings
   - Invite team members (optional)

3. **Add Tasks**
   - Select a project
   - Click "Add Task"
   - Set title, description, priority, due date
   - Assign to team members
   - Add subtasks

4. **Use AI Assistant**
   - Click the AI button
   - Ask questions or request help
   - Get task breakdowns, estimates, suggestions
   - Save and export responses

### AI Feature Examples

```
1. "Break down the task 'Build user authentication' into subtasks"
2. "Suggest a timeline for completing this project"
3. "What are best practices for API security?"
4. "Help me prioritize my tasks for this week"
5. "Generate a status report for my project"
```

## 🏗️ Architecture

### Tech Stack

**Frontend:**
- React 18.2
- React Router 6
- Tailwind CSS 3
- Recharts (Analytics)
- Socket.io Client
- Axios

**Backend:**
- Node.js & Express
- MongoDB & Mongoose
- Socket.io (WebSockets)
- JWT Authentication
- Anthropic Claude AI SDK
- Bcrypt

### Project Structure

```
CodeFlow-ai/
├── server/                 # Backend
│   ├── index.js           # Main server file
│   ├── models/            # Mongoose models
│   ├── routes/            # API routes
│   └── middleware/        # Custom middleware
├── src/                   # Frontend
│   ├── components/        # React components
│   ├── pages/             # Page components
│   ├── context/           # React context
│   ├── services/          # API services
│   ├── hooks/             # Custom hooks
│   └── utils/             # Utility functions
├── .env.example           # Environment template
├── package.json           # Dependencies
└── vite.config.js         # Vite configuration
```

## 🔒 Security Features

- ✅ JWT-based authentication
- ✅ Bcrypt password hashing (10 rounds)
- ✅ Rate limiting on all API endpoints
- ✅ Stricter rate limiting on AI & auth endpoints
- ✅ Input validation and sanitization
- ✅ CORS configuration
- ✅ Secure HTTP headers
- ✅ MongoDB injection prevention

## 📊 Performance Optimizations

- Lazy loading for routes
- Database indexing
- Response caching
- Efficient MongoDB aggregations
- WebSocket for real-time updates
- Optimized re-renders with React.memo
- Debounced search and inputs

## 🧪 Testing

```bash
# Run tests (when implemented)
npm test

# Run with coverage
npm run test:coverage
```

## 🐛 Troubleshooting

### Common Issues

**MongoDB Connection Error:**
```bash
# Check MongoDB is running
# Local:
brew services list | grep mongodb
# Or:
sudo systemctl status mongod

# Restart MongoDB
brew services restart mongodb-community
```

**Port Already in Use:**
```bash
# Change PORT in .env
# Or kill process
lsof -ti:5000 | xargs kill -9
```

**Anthropic API Error:**
- Verify API key is correct
- Check you have credits/quota
- Ensure model name is correct

## 📝 Environment Variables Reference

| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `PORT` | Server port | No | 5000 |
| `NODE_ENV` | Environment | No | development |
| `MONGODB_URI` | MongoDB connection string | Yes | - |
| `JWT_SECRET` | JWT signing secret (min 32 chars) | Yes | - |
| `ANTHROPIC_API_KEY` | Anthropic API key | Yes | - |
| `CLIENT_URL` | Frontend URL for CORS | No | http://localhost:3000 |
| `AI_MODEL` | Claude model to use | No | claude-sonnet-4-20250514 |
| `AI_MAX_TOKENS` | Max tokens per request | No | 4000 |

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📄 License

This project is licensed under the MIT License.

## 🙏 Acknowledgments

- [Anthropic](https://www.anthropic.com/) for Claude AI
- [MongoDB](https://www.mongodb.com/) for database
- [Tailwind CSS](https://tailwindcss.com/) for styling
- [React](https://react.dev/) for UI framework

## 📧 Support

For support, email support@codeflow-ai.com or open an issue on GitHub.

## 🗺️ Roadmap

- [ ] Mobile app (React Native)
- [ ] Offline mode with sync
- [ ] Advanced workflow automation
- [ ] Plugin system
- [ ] Multi-language support
- [ ] Voice commands
- [ ] Calendar integration
- [ ] Time tracking
- [ ] Gantt charts
- [ ] File attachments

---

**Made with ❤️ using React, Node.js, and Claude AI**
"# Codeflow" 
