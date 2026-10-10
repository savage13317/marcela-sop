# Marcela's Resort Hotel
**Gamay, Northern Samar, Philippines**

## MODULE 08: DIGITAL SYSTEMS, RECORDS & MAINTENANCE
**Document Code:** DS  
**Target File:** `08_digital_maintenance.html`  
**Effective Date:** October 2026  
**Property Configuration:** 30 Rooms, Restaurant, Function Hall, Swimming Pool  

---

### SOP-DS-01: Hotel Digital Systems Overview

* **Objective & Scope:** Provide a comprehensive operational framework for all hardware, software, network infrastructure, and digital tools utilized across Marcela’s Hotel & Resort. Applies to all resort departments and personnel utilizing digital touchpoints.
* **Responsible Staff Roles:** General Manager (GM), IT Officer / System Administrator, Department Heads, Front Desk Staff, Cashiers.
* **Step-by-Step Execution Procedure:**
  1. **System Architecture Identification:** Maintain a master directory of core systems:
     * *Property Management System (PMS):* Front Desk, Reservations, Room Inventory.
     * *Point of Sale (POS):* Restaurant, Bar, Room Service, Function Hall Billing.
     * *Network Infrastructure:* Dual-WAN Router (Starlink Primary + Local 4G LTE Backup), Unifi Access Points, UPS units.
     * *CCTV System:* 16-channel / 32-channel NVR with localized storage.
     * *Payment Gateways:* Maya Terminal, GCash Merchant QR Ph, Bank Transfer Portals.
  2. **Daily Startup Audit:** 
     * Verify online status of core server/router at 06:00 AM daily.
     * Ensure Uninterruptible Power Supply (UPS) battery levels read 100%.
     * Perform quick connectivity check across Front Desk and POS terminals.
  3. **Operational Readiness Check:**
     * Confirm synchronization between PMS and channel manager/OTAs (Agoda, Booking.com).
     * Verify POS system printer connectivity in Kitchen and Restaurant cashier stations.
  4. **System Outage Escalation:**
     * Immediately log connectivity drops in the *Digital Systems Logbook*.
     * Switch manually to offline failover protocols if downtime exceeds 5 minutes (refer to SOP-DS-02/03).
* **Localized Context & Considerations:**
  * Gamay, Northern Samar experiences sudden power interruptions and heavy rain cell-site degradations. All core network equipment must remain plugged directly into dedicated online UPS systems backed up by the resort generator.
* **Quality Assurance Checklist & KPIs:**
  * [ ] 100% daily log completion of system status at shift openings.
  * [ ] System Uptime Target: 99.5% operational availability.
  * [ ] Zero untracked hardware or network outages.

---

### SOP-DS-02: PMS / Reservation System Operation

* **Objective & Scope:** Standardize daily operation, guest booking management, check-in/check-out processing, and offline synchronization within the Property Management System (PMS).
* **Responsible Staff Roles:** Front Office Manager (FOM), Front Desk Agents (FDA), Reservations Staff.
* **Step-by-Step Execution Procedure:**
  1. **Shift Login & Initialization:**
     * Log in using individual assigned credentials (never share accounts).
     * Review the daily dashboard: arrivals, departures, stay-overs, out-of-order rooms, and pending payments.
  2. **Processing Reservations & Check-Ins:**
     * Cross-reference guest booking details (OTA voucher, walk-in registration, or direct booking).
     * Assign room based on clean/inspected room status received from Housekeeping.
     * Collect cash, GCash, or card deposit and record transaction immediately under guest folio.
  3. **Handling System Downtime (Offline Protocol):**
     * Print physical *Daily Arrival & Departure Manifests* at the start of every shift (06:00, 14:00, 22:00).
     * If PMS goes offline during power/internet outage, record check-ins/check-outs manually on the *Manual Guest Ledger*.
     * Re-enter manual ledger records into the PMS within 1 hour after connectivity restoration.
  4. **End-of-Day Reconciliation:**
     * Perform night audit balance run; ensure all posted charges align with cash drawer, GCash logs, and card slips.
* **Localized Context & Considerations:**
  * Northern Samar weather can affect cloud-PMS connections. Printing shift manifests on paper ensures check-in delays do not occur during sudden fiber or satellite connection drops.
* **Quality Assurance Checklist & KPIs:**
  * [ ] Shift manifest printed at start of every shift.
  * [ ] Zero discrepancy between physical payment receipts and PMS folio postings.
  * [ ] 100% catch-up sync completed within 60 minutes of internet recovery.

---

### SOP-DS-03: POS System Operation

* **Objective & Scope:** Regulate order entry, table management, charge posting to guest folios, and daily sales closing across F&B, Pool, and Function Hall outlets.
* **Responsible Staff Roles:** Restaurant Manager, F&B Cashiers, Waitstaff, Bartenders.
* **Step-by-Step Execution Procedure:**
  1. **POS Opening Routine:**
     * Power on POS terminals and receipt printers at 06:00 AM.
     * Log in using individual cashier PIN code.
     * Verify opening float cash balance against physical cash drawer.
  2. **Order Entry & Processing:**
     * Select table number/outlet zone; enter items accurately based on guest request and special dietary notes.
     * Send order digitally to Kitchen Display / Kitchen Slip Printer.
     * For room charges: Search guest name/room number in POS; verify room active status on PMS before posting. Require guest signature on printed bill slip.
  3. **Offline POS Mode (Power Failure / Network Loss):**
     * Switch POS terminal to local offline mode or use carbon-copy Order Tickets (OTs) and Official Receipts (ORs).
     * Calculate taxes (VAT 12%) and service charge manually using local rate charts.
     * Post offline receipts to the digital POS system immediately upon network recovery.
  4. **POS Closing Routine:**
     * Generate End-of-Day (Z-Reading) report.
     * Reconcile total cash, GCash transfers, card slips, and room charges against system report.
* **Localized Context & Considerations:**
  * Ensure thermal paper rolls are stored in airtight plastic containers to prevent moisture damage from high provincial humidity in Gamay.
* **Quality Assurance Checklist & KPIs:**
  * [ ] Signed room-charge slips attached to daily cashier report.
  * [ ] Zero billing discrepancies between F&B receipts and PMS guest folios.
  * [ ] Maximum 3-minute resolution time for offline ticket re-entry post-restoration.

---

### SOP-DS-04: Digital Guest Records

* **Objective & Scope:** Direct the creation, updating, archival, and secure handling of digital guest profiles, preferences, and transaction histories while ensuring legal compliance.
* **Responsible Staff Roles:** Front Desk Agents, Reservations Officer, IT Administrator.
* **Step-by-Step Execution Procedure:**
  1. **Guest Profile Creation:**
     * Input full legal name, contact number, email address, address, and nationality upon registration.
     * Scanned government ID/passport attached directly to the guest profile in PMS.
  2. **Recording Guest Preferences & History:**
     * Log dietary preferences, room location choices, allergy alerts, and special requests (e.g., extra pillows, pool towels).
     * Record past stay history, incident notes, or unfulfilled booking flags.
  3. **Data Updating & Maintenance:**
     * Verify email and phone details upon repeat check-in.
     * Flag profile for merging if duplicate entries exist (handled by FOM weekly).
  4. **Data Purging & Archival:**
     * Automatically archive inactive guest accounts older than 3 years in accordance with tax and legal requirements.
     * Securely delete non-essential personal identifiers after statutory holding periods.
* **Localized Context & Considerations:**
  * Guests from government agencies or local provincial offices frequently re-book; maintain accurate billing/TIN details on digital profiles to streamline local official invoicing (LGU requirements).
* **Quality Assurance Checklist & KPIs:**
  * [ ] Scanned valid ID attached to 100% of checked-in profiles.
  * [ ] Zero duplicate profile creation rate target (>95% accuracy).
  * [ ] Secure profile masking applied for credit card numbers.

---

### SOP-DS-05: User Account & Access Control

* **Objective & Scope:** Define the authorization matrix, role-based access control (RBAC), user creation, and revocation across all property software systems to protect sensitive resort data.
* **Responsible Staff Roles:** General Manager, IT Administrator, Department Heads.
* **Step-by-Step Execution Procedure:**
  1. **Role-Based Access Level Assignment:**
     * *Level 1 (Staff/Cashiers):* Read/Write operational functions (Order entry, check-in, billing generation). No void/discount access.
     * *Level 2 (Supervisors/Duty Managers):* Void items, apply standard discounts, process refunds, view daily summaries.
     * *Level 3 (Department Heads):* System adjustments, report generation, limited user authorization.
     * *Level 4 (GM / IT Admin):* Full system administration, user creation, privilege modification, audit log access.
  2. **Account Provisioning:**
     * Department Head submits *User Account Request Form* to IT Administrator for new hires.
     * IT creates account within 24 hours using official property email domain or standard staff ID prefix.
  3. **Immediate Account Revocation:**
     * Upon employee separation or resignation, HR notifies IT simultaneously during exit processing.
     * IT deactivates all account credentials (PMS, POS, Email, Wi-Fi access) within 1 hour of exit notice.
  4. **Quarterly Access Audit:**
     * Conduct quarterly audit of active system accounts against current payroll list to eliminate ghost or inactive users.
* **Localized Context & Considerations:**
  * Prevent common provincial resort practice of staff sharing manager PINs/passwords during busy shifts. Shared account usage is strictly prohibited and subject to disciplinary action.
* **Quality Assurance Checklist & KPIs:**
  * [ ] 100% offboarded staff accounts deactivated within 1 hour.
  * [ ] Quarterly user audit report signed by GM and IT.
  * [ ] Zero instances of shared administrative logins.

---

### SOP-DS-06: Password Management

* **Objective & Scope:** Enforce robust password security protocols, multi-factor authentication (MFA), and credential rotation to prevent unauthorized system intrusion.
* **Responsible Staff Roles:** All System Users, IT Administrator.
* **Step-by-Step Execution Procedure:**
  1. **Password Standard Mandate:**
     * Minimum 12 characters combining uppercase letters, lowercase letters, numbers, and special symbols (e.g., `Gamay#Marcela2026`).
     * Dictating, writing on sticky notes, or saving passwords in web browsers on shared terminals is strictly prohibited.
  2. **Password Renewal Cycle:**
     * Mandatory forced system password change every 90 days for operational accounts; every 60 days for administrative/financial accounts.
     * System prevents re-use of the last 5 previous passwords.
  3. **Multi-Factor Authentication (MFA):**
     * Enforce MFA via authenticator apps or SMS OTPs for all cloud management tools, cloud-PMS, official social media accounts, and banking portals.
  4. **Credential Emergency Recovery:**
     * Master passwords stored in a sealed physical envelope inside the GM Safe and in an encrypted off-site password manager controlled by property ownership.
* **Localized Context & Considerations:**
  * Ensure backup cellular phones designated for receiving SMS OTPs are charged continuously via dedicated power banks during local brownouts.
* **Quality Assurance Checklist & KPIs:**
  * [ ] 100% compliance with 90-day password expiration rules.
  * [ ] MFA enabled on all master cloud, email, and banking platforms.
  * [ ] Zero passwords exposed on physical desk surfaces or sticky notes.

---

### SOP-DS-07: CCTV System Administration

* **Objective & Scope:** Standardize camera placement, recording retention, system maintenance, access control, and footage review compliance for security and operational monitoring.
* **Responsible Staff Roles:** Security Supervisor, IT Administrator, General Manager.
* **Step-by-Step Execution Procedure:**
  1. **System Health Inspection (Daily at 07:00 AM):**
     * Check NVR status LEDs, recording indicators, disk storage health, and camera timestamps.
     * Ensure all cameras covering critical zones (Front Desk, Cash Counter, Pool Area, Gates, Perimeter, Kitchen) are functioning properly.
  2. **Recording & Retention Parameters:**
     * Minimum continuous recording retention of **30 days** at 1080p resolution.
     * NVR storage configured to overwrite oldest footage automatically upon reaching 95% capacity.
  3. **Footage Review & Retrieval Request:**
     * Viewing access restricted to Security Head, GM, and IT Administrator.
     * Third-party or guest footage requests require a formal written request, GM approval, and a official police blotter/subpoena (under National Privacy Commission guidelines).
     * Log all export actions in the *CCTV Review Register* detailing date, time, reason, and requesting authority.
  4. **Physical & Lens Maintenance:**
     * Clean camera enclosures and glass weekly to clear spider webs, dust, and sea-salt residue common in coastal Samar.
* **Localized Context & Considerations:**
  * Coastal air in Northern Samar accelerates lens fogging and bracket corrosion. Inspect external camera housings bi-weekly for saltwater degradation and seal tightness.
* **Quality Assurance Checklist & KPIs:**
  * [ ] Minimum 30 days continuous video footage retained on local NVR.
  * [ ] Daily CCTV status log updated by Security/IT.
  * [ ] 100% log recording for every footage review/export event.

---

### SOP-DS-08: Wi-Fi / Internet Monitoring

* **Objective & Scope:** Ensure continuous high-speed connectivity for resort operations and guest satisfaction through proactive WAN management, guest network bandwidth limits, and quick failover protocols.
* **Responsible Staff Roles:** IT Officer, Front Office Staff, Duty Manager.
* **Step-by-Step Execution Procedure:**
  1. **Network Bandwidth Allocation (VLAN Management):**
     * *VLAN 10 (Operations):* PMS, POS, Payment Terminals (Priority Quality of Service - QoS).
     * *VLAN 20 (Administration):* Admin Offices, Management email, CCTV.
     * *VLAN 30 (Guest Wi-Fi):* Guest access via captive portal, rate-limited to 10 Mbps download / 5 Mbps upload per user.
  2. **Dual-WAN Auto-Failover Protocol:**
     * Primary Connection: Starlink Satellite Internet (High Speed).
     * Secondary Failover: Local 4G LTE Router / Fiber ISP line.
     * Dual-WAN router configured to ping external DNS every 10 seconds; auto-switch to secondary line within 15 seconds of primary failure.
  3. **Daily Connectivity Audit:**
     * Measure speed at Front Desk and Guest Pool area twice daily (08:00 AM and 18:00 PM).
     * Reboot Access Points (APs) remotely during off-peak hours (03:00 AM) weekly.
  4. **Guest Wi-Fi Voucher/Access Handling:**
     * Front Desk provides active Wi-Fi password/captive code upon check-in.
     * Assist guests experiencing connection difficulties with resetting network settings on devices.
* **Localized Context & Considerations:**
  * Starlink satellite dishes are prone to signal disruption during extreme tropical downpours in Gamay. During severe storms, notify guests that internet speeds may decrease and prioritize bandwidth to Front Office / POS terminals.
* **Quality Assurance Checklist & KPIs:**
  * [ ] Automatic WAN failover operational within 15 seconds.
  * [ ] Guest captive portal landing page active and operational.
  * [ ] Less than 5 guest Wi-Fi complaints per month.

---

### SOP-DS-09: Digital Payment / Online Payment Monitoring

* **Objective & Scope:** Establish secure procedures for processing, verifying, and reconciling digital payments (GCash, Maya, QR Ph, Online Bank Transfers) to prevent fraud and billing discrepancies.
* **Responsible Staff Roles:** Front Desk Cashiers, F&B Cashiers, Finance / Accounting Staff.
* **Step-by-Step Execution Procedure:**
  1. **Accepting QR Ph / GCash / Maya Payments:**
     * Display official resort QR Ph codes at payment counters.
     * Require guest to scan and process transaction in front of the cashier.
     * **Verification Rule:** Cashier *must* visually check the reference number, transaction date, amount, and recipient name ("Marcela's Resort Hotel") on the guest's mobile screen.
  2. **Logging Reference Numbers:**
     * Input the exact 10-13 digit transaction Reference ID into the PMS/POS billing notes and write it on the duplicate official receipt.
     * Print or save screenshot to the daily digital payment folder (for Front Desk transactions).
  3. **Online Bank Transfer Verification:**
     * For pre-payments/deposits via BDO, BPI, or Landbank, require proof of transfer receipt sent via official email or messaging channel.
     * Accounting staff verifies direct deposit in bank online portal before confirming booking status in PMS.
  4. **Daily Digital Payment Reconciliation:**
     * At shift end, cross-reference GCash/Maya merchant web portal balances against logged transactions in POS/PMS daily reports.
* **Localized Context & Considerations:**
  * Cellular network delays in Gamay may delay SMS notifications for received GCash/Maya merchant payments. Cashiers must rely on visual verification of guest app confirmation screen AND merchant app push notification before releasing guest.
* **Quality Assurance Checklist & KPIs:**
  * [ ] 100% of digital transactions logged with valid reference numbers.
  * [ ] Zero balance mismatch between merchant digital portal and daily cash/POS sheets.
  * [ ] Zero acceptance of fake payment confirmation screenshots.

---

### SOP-DS-10: Online Booking Platform Management

* **Objective & Scope:** Regulate room rates, inventory availability, promotional setups, and channel synchronization across Online Travel Agencies (OTAs e.g., Agoda, Booking.com) and direct booking portals.
* **Responsible Staff Roles:** Sales & Marketing Manager, Reservations Officer, General Manager.
* **Step-by-Step Execution Procedure:**
  1. **Daily Rate & Allotment Management:**
     * Check Channel Manager / OTA extranets daily at 08:30 AM.
     * Ensure rate parity across all public digital sales channels unless specific closed-user promotions are authorized.
     * Update available room inventory to prevent overbooking during high-demand local festivals or holiday weekends.
  2. **Handling Direct OTA Bookings:**
     * Verify instant sync from OTA to PMS.
     * Manual entry for non-integrated channels within **15 minutes** of receiving booking notification email.
  3. **Stop-Sell Procedure (High Occupancy):**
     * When resort occupancy reaches 90% (27 out of 30 rooms), execute immediate "Stop-Sell" on external OTAs to preserve room buffer for walk-ins and direct phone bookings.
  4. **OTA Review & Communication Monitoring:**
     * Respond to guest messages on OTA portals within 2 hours of receipt.
     * Track guest reviews weekly; submit management responses within 48 hours.
* **Localized Context & Considerations:**
  * Gamay’s local events (e.g., town fiesta, regional government summits) cause sudden spikes in room demand. Reservations staff must lock down OTA discount rates during peak regional dates.
* **Quality Assurance Checklist & KPIs:**
  * [ ] Zero overbooking instances caused by channel lag.
  * [ ] OTA messaging response rate >95% within 2 hours.
  * [ ] Rate parity maintained across all online portals daily.

---

### SOP-DS-11: Social Media / Digital Inquiry Management

* **Objective & Scope:** Guide staff in responding to direct inquiries, reservations, and comments on official resort social media channels (Facebook, Instagram, TikTok) professionally and promptly.
* **Responsible Staff Roles:** Social Media Coordinator, Front Desk Officers, Duty Manager.
* **Step-by-Step Execution Procedure:**
  1. **Channel Monitoring Schedule:**
     * Monitor official Facebook Page, Instagram Direct Messages, and Messenger continuously between 06:00 AM and 10:00 PM daily.
  2. **Standard Response Protocol:**
     * Acknowledge inquiries within **15 minutes** using friendly, professional branding language: *"Marhay na adlaw! Thank you for messaging Marcela’s Hotel & Resort..."*
     * Provide room rates, function hall rates, day-tour pool rates, and direct booking links clearly.
  3. **Handling Reservations via Messaging Apps:**
     * Collect full name, contact number, email, check-in/out dates, room type, and total guests.
     * Issue official payment instructions for reservation deposit (50% required within 24 hours).
     * Input booking into PMS under "Pending Deposit" status.
  4. **Escalation of Complaints:**
     * Do not debate or argue publicly on comment sections.
     * Invite disgruntled guests to private message: *"We care about your experience. Please send us a direct message or call [Phone Number] so our Manager can assist you immediately."*
* **Localized Context & Considerations:**
  * A majority of provincial domestic travelers in Eastern Visayas make inquiries directly through Facebook Messenger rather than email or website forms. Response speed directly impacts occupancy rates.
* **Quality Assurance Checklist & KPIs:**
  * [ ] Average messaging response time under 15 minutes.
  * [ ] 100% negative public comments directed to private resolution channels within 30 minutes.
  * [ ] Zero unauthorized staff personal statements on official pages.

---

### SOP-DS-12: Google Business Profile Management

* **Objective & Scope:** Maintain accurate property information, operating hours, photos, location mapping, and review management on Google Search and Google Maps.
* **Responsible Staff Roles:** IT Administrator, Marketing Coordinator, GM.
* **Step-by-Step Execution Procedure:**
  1. **Profile Data Accuracy Audit (Monthly):**
     * Verify operational hours, phone numbers, contact email, street address (Gamay, Northern Samar), and website URL.
     * Update room pricing ranges and amenity highlights (e.g., Pool, Function Hall, Restaurant, Parking, Free Wi-Fi).
  2. **Photo & Content Updates:**
     * Upload high-resolution photos bi-weekly (e.g., guest events, fresh F&B dishes, clean pool, refurbished rooms).
     * Post Google Updates regarding upcoming holiday promos, resort events, or weather/road access advisories.
  3. **Review Monitoring & Management:**
     * Monitor incoming reviews every Monday and Thursday.
     * Respond to all reviews (positive and negative) within 72 hours.
     * *Positive Review Response:* Thank the guest personally, mention specific details they enjoyed.
     * *Negative Review Response:* Express empathy, state commitment to service improvement, provide direct contact details of GM for resolution.
  4. **Map Pin & Navigation Verification:**
     * Periodically check pin placement on Google Maps to ensure GPS routing brings guests accurately to the resort entrance.
* **Localized Context & Considerations:**
  * Heavy roadworks or typhoon repairs along Northern Samar highways can confuse travelers. Update profile posts with clear driving directions from Catarman or Calbayog airports during stormy seasons.
* **Quality Assurance Checklist & KPIs:**
  * [ ] Profile information 100% accurate at all times.
  * [ ] 100% of Google reviews responded to within 72 hours.
  * [ ] Minimum overall Google rating target: 4.2 Stars.

---

### SOP-DS-13: Digital Document Filing

* **Objective & Scope:** Establish a standardized directory structure, file naming convention, and cloud storage system for administrative, legal, financial, and operational digital records.
* **Responsible Staff Roles:** Administrative Assistant, IT Administrator, Department Heads.
* **Step-by-Step Execution Procedure:**
  1. **Master Folder Structure (Google Drive / Shared Server):**
     ```text
     [00_MARCELA_MASTER_DRIVE]
     ├── 01_ADMIN_LEGAL_PERMITS
     ├── 02_FINANCE_ACCOUNTING
     ├── 03_HUMAN_RESOURCES
     ├── 04_OPERATIONS_SOP
     ├── 05_MARKETING_ASSETS
     └── 06_FACILITIES_MAINTENANCE
     ```
  2. **Standard File Naming Convention:**
     * Standard Format: `YYYY-MM-DD_[DocType]_[Description]_[vVersion/Initials]`
     * *Example:* `2026-10-15_PERMIT_MayorPermitRenewal_v1.pdf`
     * *Example:* `2026-10-08_REPORT_DailyF&BSales_FDA.xlsx`
  3. **Filing Timeline & Discipline:**
     * Save daily financial reports before midnight.
     * Scanned contracts and official receipts filed within 24 hours of execution.
  4. **Access Rights Control:**
     * Apply read-only permissions for general staff folders; restrict edit rights to respective Department Heads.
* **Localized Context & Considerations:**
  * Scanned copies of local government permits (Gamay LGU Mayor's Permit, DENR clearance, BIR registration) must be instantly downloadable on management phones during surprise local agency inspections.
* **Quality Assurance Checklist & KPIs:**
  * [ ] 100% compliance with standardized file naming convention.
  * [ ] Zero unorganized documents on public shared desktop areas.
  * [ ] Instant retrieval time (<2 minutes) for any regulatory permit file.

---

### SOP-DS-14: Data Backup Procedure

* **Objective & Scope:** Define the automated and manual schedule, redundancy protocols, and off-site backup verification for all essential operational, guest, and financial data.
* **Responsible Staff Roles:** IT Administrator, System Operator, Finance Head.
* **Step-by-Step Execution Procedure:**
  1. **3-2-1 Backup Strategy Implementation:**
     * Maintain **3** total copies of data.
     * Stored across **2** different media types (Local NAS/SSD + Cloud Storage).
     * Keeping **1** copy off-site (Encrypted Cloud Backup).
  2. **Daily Automated Backup Routine:**
     * *Database/PMS/POS:* Automated incremental backup every night at 02:00 AM to local Network Attached Storage (NAS).
     * *Cloud Sync:* Automatic sync of NAS data to encrypted Google Workspace Enterprise Cloud Drive at 03:00 AM.
  3. **Weekly Manual Offline Backup:**
     * IT Administrator performs an offline snapshot backup to an external encrypted hard drive every Sunday at 23:00 PM.
     * Store the external hard drive inside a fireproof, waterproof safe in the Executive Office.
  4. **Backup Log Verification:**
     * Check backup success notification log daily at 08:00 AM.
     * Re-run failed backups immediately upon discovering network or execution errors.
* **Localized Context & Considerations:**
  * Physical off-site drive backups are vital in Gamay to protect historical data against sudden severe typhoon flooding or extended regional power grid failures.
* **Quality Assurance Checklist & KPIs:**
  * [ ] Daily backup verification log signed off every morning.
  * [ ] Weekly offline physical drive backup completed and secured in fireproof safe.
  * [ ] 100% data integrity check success on cloud backup portals.

---

### SOP-DS-15: Data Recovery Procedure

* **Objective & Scope:** Detail step-by-step restore protocols to quickly recover digital systems, databases, and operational files following hardware failure, cyber incidents, or disaster events.
* **Responsible Staff Roles:** IT Administrator, General Manager, Department Heads.
* **Step-by-Step Execution Procedure:**
  1. **Incident Identification & System Isolation:**
     * Declare data loss event (e.g., corrupted PMS database, drive crash, ransomware infection).
     * Immediately disconnect affected terminals/servers from the network (unplug Ethernet cables, disable Wi-Fi) to isolate damage.
  2. **Selecting Recovery Point Objective (RPO):**
     * Identify the most recent clean backup timestamp (Target RPO: Less than 24 hours old).
  3. **Restoration Execution Steps:**
     * *Step A:* Format/sanitize target hardware or prepare clean replacement equipment.
     * *Step B:* Retrieve clean backup image from Cloud or local offline external hard drive.
     * *Step C:* Execute system restore utility under IT Administrator supervision.
     * *Step D:* Perform database integrity check and verify record counts against paper logbooks/manifests.
  4. **Post-Recovery Verification & Re-connection:**
     * Run isolated operational test transactions on POS/PMS before reconnecting system to main network.
     * Re-key manual paper logs generated during downtime.
  5. **Disaster Recovery Simulation Test:**
     * Conduct bi-annual mock data recovery drill (every April and October) to test restore speed (Target Recovery Time Objective - RTO: <4 hours).
* **Localized Context & Considerations:**
  * Maintain pre-configured spare replacement PCs/terminals on-site to swap out hardware ruined by electrical lightning surges during Samar thunderstorms.
* **Quality Assurance Checklist & KPIs:**
  * [ ] System Recovery Time Objective (RTO) achieved within 4 hours.
  * [ ] Zero permanent loss of critical guest or accounting records.
  * [ ] Bi-annual data recovery drill completed and documented.

---

### SOP-DS-16: Cybersecurity & Phishing Prevention

* **Objective & Scope:** Establish safeguards against malware, phishing emails, ransomware, unauthorized network intrusions, and social engineering attacks targeting hotel systems.
* **Responsible Staff Roles:** IT Administrator, All Staff Members, Department Managers.
* **Step-by-Step Execution Procedure:**
  1. **Endpoint Protection & Antivirus:**
     * Install centralized managed Endpoint Protection/Antivirus software on all resort computers.
     * Configure real-time scanning and automatic daily virus definition updates (05:00 AM).
  2. **Phishing Email Identification Protocol:**
     * Train staff to inspect email senders carefully. Look out for red flags: unusual domains, urgent wire transfer requests, suspicious links, or unsolicited attachments (`.exe`, `.zip`, `.scr`).
     * **Verification Rule:** Never click external links or open attachments in unverified emails claiming to be from "Agoda", "Booking.com", "Bank", or "Government".
  3. **USB & External Device Control:**
     * Disable unauthorized USB flash drive auto-run on Front Office and POS terminals.
     * Require IT scanning of any external media before connecting to resort computers.
  4. **Reporting Security Incidents:**
     * Staff must immediately report suspicious emails, pop-up security warnings, or locked files to IT (`it@marcelasresort.ph`) and disconnect the device from the network.
  5. **Staff Security Awareness Training:**
     * Conduct mandatory cybersecurity orientation for new hires and bi-annual refreshers for all staff.
* **Localized Context & Considerations:**
  * OTA messaging platforms are frequent targets for spear-phishing scams. Front desk staff must never send guest credit card details or click external links sent via guest messaging apps.
* **Quality Assurance Checklist & KPIs:**
  * [ ] 100% active endpoints with updated antivirus software.
  * [ ] Zero successful malware or ransomware infections.
  * [ ] 100% new staff completion of cybersecurity orientation.

---

### SOP-DS-17: Guest Data Privacy & Confidentiality

* **Objective & Scope:** Ensure strict compliance with the **Philippine Data Privacy Act of 2012 (Republic Act No. 10173)**, safeguarding personal identifiable information (PII) of guests and employees.
* **Responsible Staff Roles:** Data Protection Officer (DPO / GM), IT Administrator, Front Office Staff.
* **Step-by-Step Execution Procedure:**
  1. **Data Minimization & Consent Collection:**
     * Collect only necessary guest information required for booking, legal identification, and billing.
     * Ensure guest sign the Data Privacy Consent Clause on physical or digital registration cards upon check-in.
  2. **Physical Data Security:**
     * Keep printed guest folios, registration forms, and credit card slips inside locked drawers or cabinets.
     * Shred discarded papers containing guest PII using a cross-cut shredder at shift end.
  3. **Digital Data Masking & Restrictions:**
     * Mask credit card numbers (displaying only last 4 digits) on screen and printed receipts.
     * Prohibit staff from taking personal photos/videos of guest registration screens, passports, or IDs using personal smartphones.
  4. **Handling Third-Party Inquiries:**
     * Never confirm guest room numbers, stay dates, or presence to outside callers or visitors without explicit guest authorization.
  5. **Data Breach Reporting:**
     * DPO must report any confirmed data breach affecting personal information to the National Privacy Commission (NPC) and affected guests within 72 hours of discovery.
* **Localized Context & Considerations:**
  * In small communities like Gamay, local inquiries regarding famous or high-profile resort guests are common. Staff must strictly adhere to non-disclosure protocols regardless of local relationships.
* **Quality Assurance Checklist & KPIs:**
  * [ ] Signed privacy consent obtained on 100% of guest registrations.
  * [ ] Zero unauthorized disclosures of guest personal information.
  * [ ] Daily cross-cut shredding of temporary documents containing PII.

---

### SOP-DS-18: Digital Incident Reporting

* **Objective & Scope:** Provide a structured reporting and resolution process for all digital equipment failures, network disruptions, software errors, and cyber security breaches.
* **Responsible Staff Roles:** Incident Reporter (Any Staff), IT Officer, Duty Manager, GM.
* **Step-by-Step Execution Procedure:**
  1. **Incident Severity Categorization:**
     * *Low (Severity 3):* Single workstation bug, minor printer paper jam, individual Wi-Fi AP reboot needed.
     * *Medium (Severity 2):* POS printer down, individual payment terminal offline, partial OTA channel sync failure.
     * *High/Critical (Severity 1):* Complete network down, PMS crash, total power blackout affecting UPS, cybersecurity breach, CCTV failure.
  2. **Submitting Digital Work Order / Incident Ticket:**
     * Staff fills out the *Digital Incident Form* on Google Forms / Local Intranet detailing: Time, System/Hardware affected, Error Message, Severity, Immediate Action Taken.
     * For Critical (Severity 1) incidents: Call IT Officer and Duty Manager immediately via phone/radio.
  3. **Resolution & Escalation Matrix:**
     * *Severity 3:* Resolution target <4 hours.
     * *Severity 2:* Resolution target <1 hour.
     * *Severity 1:* Immediate response (<15 mins); Resolution/Failover activated <30 mins.
  4. **Post-Incident Review:**
     * IT logs root cause, permanent fix, and preventive recommendations in the *Master IT Incident Logbook*.
* **Localized Context & Considerations:**
  * If local IT cannot resolve hardware issues due to rural location component shortages, escalate immediately to regional vendors in Tacloban or Manila with expedited courier transport.
* **Quality Assurance Checklist & KPIs:**
  * [ ] 100% of IT incidents formally logged with ticket numbers.
  * [ ] Severity 1 incidents responded to within 15 minutes.
  * [ ] Monthly IT incident trend report submitted to GM.

---

### SOP-DS-19: IT Equipment Inventory

* **Objective & Scope:** Govern the tracking, asset tagging, physical maintenance, and auditing of all IT assets (PCs, printers, routers, switches, UPS, TV displays, POS hardware) across the property.
* **Responsible Staff Roles:** IT Administrator, Property Auditor, Admin Manager.
* **Step-by-Step Execution Procedure:**
  1. **Asset Tagging & Registry Entry:**
     * Apply barcode/asset tag label to hardware upon delivery: Format `MH-IT-[Category]-[001]` (e.g., `MH-IT-POS-003`).
     * Record serial number, purchase date, warranty period, vendor contact, cost, and location in *Master IT Asset Register*.
  2. **Quarterly Physical Audit:**
     * Conduct physical audit every 3 months to verify location, working condition, and user assignment of every tagged asset.
  3. **Preventive Hardware Maintenance (Monthly):**
     * Blow out dust from PC towers, server racks, and network switches using compressed dry air.
     * Inspect battery terminals on UPS units for swelling or corrosion.
     * Check marine-grade protective covers on outdoor access points and network cabling.
  4. **Decommissioning & Disposal:**
     * Hardware older than statutory lifespan or broken beyond repair is sanitized (hard drive wiped/destroyed) and written off with GM and Finance approval.
* **Localized Context & Considerations:**
  * Salty coastal air in Gamay accelerates hardware corrosion. Ensure desktop units and servers are housed in air-conditioned spaces with silica gel packs inside electrical cabinets.
* **Quality Assurance Checklist & KPIs:**
  * [ ] 100% of resort IT assets tagged and registered.
  * [ ] Quarterly physical IT inventory match rate: 100%.
  * [ ] Monthly physical dust and UPS health checks logged.

---

### SOP-DS-20: Website / Google Sites SOP Manual Maintenance

* **Objective & Scope:** Outline procedures for publishing, updating, structuring, and maintaining accessibility of the online Google Sites operations manual (`08_digital_maintenance.html` and companion modules).
* **Responsible Staff Roles:** IT Administrator, Quality Assurance Officer, GM.
* **Step-by-Step Execution Procedure:**
  1. **Site Structure & Navigation Management:**
     * Maintain standardized Google Sites navigation tree corresponding to Modules 01 through 08.
     * Ensure responsive viewing compatibility across desktop, tablet, and smartphone screens.
  2. **Content Updating Procedure:**
     * Receive approved SOP revision from Department Head / GM.
     * Update digital text, embedded checklists, and downloadable PDF forms on the Google Site page within 24 hours of approval.
  3. **Access Security & Viewer Controls:**
     * Google Site access restricted to `@marcelasresort.ph` staff email domain accounts.
     * Prevent public indexing or external sharing of internal SOP site links.
  4. **Broken Link & Page Speed Audits:**
     * Run monthly site audit to check for broken links, missing embedded forms, or slow-loading attachments.
* **Localized Context & Considerations:**
  * Staff access the SOP site on mobile phones via local Wi-Fi. Keep embedded image sizes optimized (<500KB) to ensure quick page loading during mobile network slowdowns.
* **Quality Assurance Checklist & KPIs:**
  * [ ] 100% of approved SOP revisions updated on Google Site within 24 hours.
  * [ ] Zero public/external access permitted to internal SOP site.
  * [ ] Monthly link integrity check completed without errors.

---

### SOP-DS-21: SOP Revision & Version Control

* **Objective & Scope:** Maintain strict document control, version numbering, review workflows, and historical archiving for all resort Standard Operating Procedures.
* **Responsible Staff Roles:** General Manager, QA / Compliance Officer, Department Heads.
* **Step-by-Step Execution Procedure:**
  1. **Version Control Identification Standard:**
     * Document header must show: Document Code, Title, Effective Date, Version Number.
     * *Version 1.0:* Initial official publish.
     * *Version 1.1 - 1.9:* Minor updates (typo fixes, minor step adjustments, formatting).
     * *Version 2.0:* Major structural overhaul or policy restructuring.
  2. **SOP Change Request Workflow:**
     * Department Head completes *SOP Revision Request Form* detailing proposed change and operational reason.
     * GM reviews and signs approval.
  3. **Document Updating & Archival:**
     * Update master document in digital drive; increment version number and update *Revision History Table* at end of document.
     * Move previous version to `[04_OPERATIONS_SOP]/ARCHIVED_VERSIONS` folder. Never overwrite historical versions.
  4. **Annual Master SOP Review:**
     * Conduct annual review of all 8 SOP modules every November to prepare for the upcoming year's operational standards.
* **Localized Context & Considerations:**
  * Ensure paper copies displayed in operational zones (Kitchen, Front Desk, Maintenance shed) are stamped "CONTROLLED COPY - [Date]" and swapped out immediately upon digital version updates.
* **Quality Assurance Checklist & KPIs:**
  * [ ] Master Revision History table updated on 100% of modified SOPs.
  * [ ] Archived versions preserved in dedicated secure folder.
  * [ ] Annual comprehensive SOP review executed every November.

---

### SOP-DS-22: Digital Forms & Checklists Management

* **Objective & Scope:** Standardize the creation, deployment, submission tracking, and data retention of all digital operational forms and inspection checklists (Google Forms / AppSheet / Web Forms).
* **Responsible Staff Roles:** IT Administrator, Department Supervisors, Quality Assurance Officer.
* **Step-by-Step Execution Procedure:**
  1. **Digital Form Creation Guidelines:**
     * Build forms with clear mandatory fields (`* Required`).
     * Standard form structure: Date, Shift, Inspector Name, Department, Checklist Items (Pass / Fail / NA), Notes, Photo Upload field for deficiencies.
  2. **Form Deployment & QR Code Placement:**
     * Generate unique QR codes linking directly to daily operational forms (e.g., *Housekeeping Room Inspection*, *Pool Water Test Log*, *Facilities Daily Audit*).
     * Laminate and mount QR codes at designated inspection stations (Pool Pump Room, Housekeeping Pantry, Kitchen, Front Desk).
  3. **Daily Submission Auditing:**
     * System automatically routes completed form responses to Google Sheets / central database.
     * Department Supervisors verify 100% completion of daily digital checklists by 10:00 AM and 18:00 PM.
  4. **Deficiency Escalation Automation:**
     * Configure form logic so that any "FAIL" rating triggers an automated email notification to Maintenance / Department Manager for corrective action.
  5. **Data Retention & Archive:**
     * Maintain digital checklist submissions for a minimum of 12 months for quality auditing and performance evaluation.
* **Localized Context & Considerations:**
  * Mobile devices used for scanning QR codes and completing checklists in outdoor areas (Pool, Gardens) must be protected with heavy-duty waterproof/shockproof cases against tropical weather.
* **Quality Assurance Checklist & KPIs:**
  * [ ] 100% submission rate for mandatory daily operational forms.
  * [ ] Automated email alert functioning for any failed checklist item.
  * [ ] QR code access points active and legible at all inspection locations.

---

### Master Version Control & Approval Matrix — Module 08

| Module Version | Date | Key Changes / Notes | Prepared By | Approved By |
| :--- | :--- | :--- | :--- | :--- |
| **v1.0** | Oct 8, 2026 | Initial master rollout for Marcela's Resort Hotel | IT & Systems SOP Writer | General Manager |
