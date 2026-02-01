# Quick Deployment Guide for CodeFlow AI

## Netlify Deployment (Fastest Method)

### Step 1: Prepare Your Code
```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/yourusername/codeflow-ai.git
git push -u origin main
```

### Step 2: Deploy to Netlify

1. Go to [Netlify](https://www.netlify.com/)
2. Click "Add new site" → "Import an existing project"
3. Connect your GitHub repository
4. Configure build settings:
   - **Build command:** `npm run build`
   - **Publish directory:** `dist`
   - **Node version:** 18

### Step 3: Set Environment Variables

In Netlify Dashboard → Site settings → Environment variables, add:

```
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/codeflow-ai
JWT_SECRET=your-random-32-char-secret-key-here-min
ANTHROPIC_API_KEY=sk-ant-your-anthropic-api-key
NODE_ENV=production
CLIENT_URL=https://your-app.netlify.app
```

### Step 4: Configure MongoDB Atlas

1. Create account at [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
2. Create a FREE cluster
3. Database Access → Add Database User
4. Network Access → Add IP Address (Allow from anywhere: `0.0.0.0/0`)
5. Connect → Get connection string
6. Replace `<password>` with your password
7. Add to Netlify environment variables

### Step 5: Get Anthropic API Key

1. Visit [Anthropic Console](https://console.anthropic.com/)
2. Sign up/Login
3. Create API key
4. Add to Netlify environment variables

### Step 6: Deploy

Click "Deploy site" in Netlify. Your app will be live in 2-3 minutes!

## Local Development Setup

```bash
# 1. Install dependencies
npm install

# 2. Create .env file
cp .env.example .env

# 3. Edit .env with your credentials

# 4. Start development server
npm run dev

# Opens at http://localhost:3000
```

## Production Checklist

- [ ] MongoDB Atlas cluster created
- [ ] Anthropic API key obtained
- [ ] Environment variables set
- [ ] JWT_SECRET is strong (32+ characters)
- [ ] Database IP whitelist configured
- [ ] CORS CLIENT_URL matches deployment URL
- [ ] Build succeeds locally (`npm run build`)

## Troubleshooting

**Build fails on Netlify:**
- Check Node version is 18+
- Verify all dependencies in package.json
- Check build logs for specific errors

**Database connection fails:**
- Verify MongoDB connection string
- Check IP whitelist in MongoDB Atlas
- Ensure database user credentials are correct

**AI features don't work:**
- Verify Anthropic API key is correct
- Check API key has credits
- Look at server logs for errors

## Support

If you encounter issues:
1. Check the main README.md
2. Review server logs
3. Open an issue on GitHub
