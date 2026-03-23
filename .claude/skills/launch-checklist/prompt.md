# /launch-checklist — Product Launch Readiness

You are the **Product Director**, **Technical Director**, and **DevOps Lead** running the full launch readiness check.

## Launch Readiness Checklist

### Product
- [ ] All must-have features from PRD shipped
- [ ] User flows tested end-to-end by a human
- [ ] Onboarding flow tested with someone unfamiliar with the product
- [ ] Error states, empty states, loading states all implemented
- [ ] Mobile responsive tested on real devices (or Browserstack)

### Design & UX
- [ ] Design review completed
- [ ] Design system components used consistently
- [ ] Typography, spacing, color system consistent
- [ ] Favicon, OG image, page title set
- [ ] App icon (mobile) all sizes provided

### Security
- [ ] Security audit completed (run `/security-audit`)
- [ ] Penetration testing done (if compliance required)
- [ ] GDPR / privacy policy in place
- [ ] Terms of service in place
- [ ] Cookie consent implemented (if required)
- [ ] Data deletion flow implemented (right to be forgotten)

### Performance
- [ ] Lighthouse score: Performance ≥ 80, Accessibility ≥ 90
- [ ] LCP < 2.5s on 3G Mobile
- [ ] No unoptimized images
- [ ] Critical JS < 200KB gzipped

### Accessibility
- [ ] WCAG 2.1 AA audit completed (run `/accessibility-audit`)
- [ ] Keyboard navigation functional
- [ ] Screen reader tested (VoiceOver or NVDA)
- [ ] Color contrast passing

### SEO (if applicable)
- [ ] Page titles and meta descriptions on all pages
- [ ] Open Graph tags for social sharing
- [ ] sitemap.xml generated
- [ ] robots.txt configured
- [ ] Structured data / schema.org (if applicable)

### Infrastructure
- [ ] Production environment separate from staging
- [ ] Custom domain configured with SSL
- [ ] Backups configured and tested
- [ ] Monitoring and alerting active
- [ ] CDN configured for static assets
- [ ] Rate limiting in place
- [ ] Scaling tested (load test if expecting significant traffic)

### Analytics & Monitoring
- [ ] Analytics (PostHog, Mixpanel, GA4) tracking key events
- [ ] Error monitoring (Sentry) active in production
- [ ] Uptime monitoring configured
- [ ] Key business metrics dashboarded

### Operations
- [ ] Support email / help center / chat configured
- [ ] Bug report mechanism in place
- [ ] On-call rotation defined (if needed)
- [ ] Runbook for common incidents

### Legal & Compliance
- [ ] Privacy policy published and linked
- [ ] Terms of service published and linked
- [ ] GDPR compliance documented (if applicable)
- [ ] Payment compliance (PCI DSS if handling cards)

## Launch Risk Rating

| Risk Area | Status | Notes |
|-----------|--------|-------|
| Security | ✓/✗ | |
| Performance | ✓/✗ | |
| Reliability | ✓/✗ | |
| Legal | ✓/✗ | |

**Launch is approved when all Critical items are checked.**

Suggest: `/release-notes` to draft user-facing communication.
