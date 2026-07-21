# INTTRA API — onboarding notes

**Source:** supplied by Ricardo, 2026-07-21 (pasted into the Kickoff Brief review). Generic vendor
onboarding reference — contains **no credentials**, only placeholders. Used to right-size the INTTRA
point in [../05_Kickoff_Brief.md](../05_Kickoff_Brief.md): access is standard, not a headline risk.

## 1. Overview & capabilities

The INTTRA API (by e2open) enables direct system-to-system integration with 60+ global ocean
carriers and thousands of freight forwarders. Modules:

- **Booking API** — electronic booking submission, amendments, real-time confirmations.
- **Ocean Schedules API** — sailing schedules, vessel voyages, transit times, port pairs.
- **Visibility / Track & Trace API** — container status, milestone events, ETA changes via REST + webhooks.
- **VGM & Rates API** — weight-compliance submissions and spot/contract rate retrieval.

## 2. Onboarding steps

1. **Company account registration** — check for an existing INTTRA Company ID; if new, complete the
   company registration form (role, SCAC if applicable, address, primary admin contact).
2. **Request API access & credentials** — via the e2open Account Manager or an integration request in
   the Knowledge Center / Support Hub. Specify endpoints (Booking, Schedules, Track & Trace, VGM) and
   expected volumes. Receive Sandbox Client ID, Client Secret, portal login.
3. **Sandbox testing & development** — docs at apidocs.inttra.com; call the Authentication API to get
   a bearer token; optionally register an HTTPS webhook callback + secret; run tests in UAT/Sandbox.
4. **Carrier activation & production go-live** — request commercial carrier connections in the portal;
   switch base URLs from Sandbox to Production once carrier linkages and UAT pass.

## 3. Lead times


| Stage                                                         | Estimated lead time                        |
| ------------------------------------------------------------- | ------------------------------------------ |
| Company account approval (identity validation, Company ID)    | 1–3 business days                         |
| API provisioning (dev keys, secrets, sandbox)                 | 3–5 business days                         |
| Carrier linkage / mapping (carrier-side approval)             | 24h – 5 business days (varies by carrier) |
| Sandbox testing & certification (payload mapping, validation) | 1–2 weeks (depends on internal resources) |
| **Total end-to-end**                                          | **1–3 weeks**                             |

## 4. Technical architecture

- **Auth:** OAuth 2.0 / token-based. Header `Authorization: Bearer <TOKEN>`. Tokens retrieved
  dynamically via the Authentication API before calling consumer endpoints.
- **Webhooks:** INTTRA POSTs a JSON payload to the customer endpoint (e.g. `/booking/webhook`) with an
  auth-header secret key; customer returns `200 OK`.

## 5. Resources

- Registration portal: `registration.inttra.com`
- Developer docs: `apidocs.inttra.com`
- e2open Knowledge Center: `knowledge.e2open.com/knowledgecenter/inttra`
- Account management / login: `inttra.com/account`

---

**Takeaway for the engagement:** INTTRA access is a standard OAuth2/REST onboarding on a ~1–3 week
clock — a logistics item, not a schedule risk. The real question is *timing*: confirm a Company ID and
account contact exist, then provision when the booking capability is actually next in the sequence,
rather than chasing credentials months ahead of use.
