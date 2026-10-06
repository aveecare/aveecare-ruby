# frozen_string_literal: true

# Code generated from the AveeCare OpenAPI specification. DO NOT EDIT.

module Aveecare
  module Models
    # Whether this person is a prospective client or an admitted client. `null` means client.
    # Prospects appear in the prospective-patient pool in AveeCare, not on the patient roster.
    module PatientLifecycleStage
      PROSPECT = "Prospect"
      CLIENT = "Client"
      # Every value this version of the library knows. The API may add more.
      VALUES = [PROSPECT, CLIENT].freeze
    end

    # The main type of service the patient receives.
    module PatientServiceType
      SKILLED_NURSING = "SkilledNursing"
      PHYSICAL_THERAPY = "PhysicalTherapy"
      HOSPICE = "Hospice"
      STANDARD_CARE = "StandardCare"
      # Every value this version of the library knows. The API may add more.
      VALUES = [SKILLED_NURSING, PHYSICAL_THERAPY, HOSPICE, STANDARD_CARE].freeze
    end

    # How statements are delivered.
    module PatientStatementDelivery
      EMAIL = "Email"
      MAIL = "Mail"
      EMAIL_AND_MAIL = "EmailAndMail"
      NO_STATEMENT = "NoStatement"
      # Every value this version of the library knows. The API may add more.
      VALUES = [EMAIL, MAIL, EMAIL_AND_MAIL, NO_STATEMENT].freeze
    end

    # How the patient usually pays.
    module PatientPaymentMethodPreference
      ACH = "ACH"
      CARD = "Card"
      CHECK = "Check"
      CASH = "Cash"
      PAYER_ONLY = "PayerOnly"
      OTHER = "Other"
      # Every value this version of the library knows. The API may add more.
      VALUES = [ACH, CARD, CHECK, CASH, PAYER_ONLY, OTHER].freeze
    end

    # The client's status as shown in AveeCare. `Inactive` and `Discharged` mean the person is no
    # longer receiving care. A prospective client (`lifecycleStage: Prospect`) reads `Prospect`
    # even if you send `Active`. Creating a patient with `Prospect` makes them a prospective
    # client. Defaults to `Active`.
    module PatientCreateStatus
      ACTIVE = "Active"
      INACTIVE = "Inactive"
      PROSPECT = "Prospect"
      DISCHARGED = "Discharged"
      # Every value this version of the library knows. The API may add more.
      VALUES = [ACTIVE, INACTIVE, PROSPECT, DISCHARGED].freeze
    end

    # Which updates the contact is notified about.
    module ContactNotificationPolicy
      ALL = "All"
      EMERGENCIES = "Emergencies"
      # Every value this version of the library knows. The API may add more.
      VALUES = [ALL, EMERGENCIES].freeze
    end

    # `Scheduled` for regular doses, `PRN` for as-needed.
    module MedicationScheduleType
      SCHEDULED = "Scheduled"
      PRN = "PRN"
      # Every value this version of the library knows. The API may add more.
      VALUES = [SCHEDULED, PRN].freeze
    end

    # Whether the medication is currently given.
    module MedicationStatus
      ACTIVE = "Active"
      ON_HOLD = "OnHold"
      DISCONTINUED = "Discontinued"
      # Every value this version of the library knows. The API may add more.
      VALUES = [ACTIVE, ON_HOLD, DISCONTINUED].freeze
    end

    # What happened to the dose.
    module MedicationAdministrationStatus
      GIVEN = "Given"
      REFUSED = "Refused"
      HELD = "Held"
      MISSED = "Missed"
      SELF_ADMINISTERED = "SelfAdministered"
      # Every value this version of the library knows. The API may add more.
      VALUES = [GIVEN, REFUSED, HELD, MISSED, SELF_ADMINISTERED].freeze
    end

    # Which OASIS time point this assessment covers.
    module OasisAssessmentTimepoint
      SOC = "SOC"
      ROC = "ROC"
      RECERTIFICATION = "Recertification"
      TRANSFER = "Transfer"
      DISCHARGE = "Discharge"
      DEATH_AT_HOME = "DeathAtHome"
      # Every value this version of the library knows. The API may add more.
      VALUES = [SOC, ROC, RECERTIFICATION, TRANSFER, DISCHARGE, DEATH_AT_HOME].freeze
    end

    # Where the assessment is in its lifecycle.
    module OasisAssessmentStatus
      DRAFT = "Draft"
      COMPLETED = "Completed"
      EXPORTED = "Exported"
      ACCEPTED = "Accepted"
      REJECTED = "Rejected"
      INACTIVATED = "Inactivated"
      # Every value this version of the library knows. The API may add more.
      VALUES = [DRAFT, COMPLETED, EXPORTED, ACCEPTED, REJECTED, INACTIVATED].freeze
    end

    # Employment status.
    module CaregiverStatus
      ACTIVE = "Active"
      ON_LEAVE = "OnLeave"
      INACTIVE = "Inactive"
      # Every value this version of the library knows. The API may add more.
      VALUES = [ACTIVE, ON_LEAVE, INACTIVE].freeze
    end

    # Where the visit is in its day. New visits are `Scheduled`.
    module VisitStatus
      SCHEDULED = "Scheduled"
      IN_PROGRESS = "InProgress"
      CANCELLED = "Cancelled"
      COMPLETED = "Completed"
      LATE = "Late"
      OVER_TIME = "OverTime"
      INCOMPLETE = "Incomplete"
      # Every value this version of the library knows. The API may add more.
      VALUES = [SCHEDULED, IN_PROGRESS, CANCELLED, COMPLETED, LATE, OVER_TIME, INCOMPLETE].freeze
    end

    # Electronic visit verification status.
    module VisitEvvStatus
      PENDING = "Pending"
      VALIDATED = "Validated"
      FLAGGED = "Flagged"
      OVERRIDDEN = "Overridden"
      EXPORTED = "Exported"
      SUBMITTED = "Submitted"
      # Every value this version of the library knows. The API may add more.
      VALUES = [PENDING, VALIDATED, FLAGGED, OVERRIDDEN, EXPORTED, SUBMITTED].freeze
    end

    # Whether the visit has been billed.
    module VisitBillingStatus
      NOT_BILLED = "NotBilled"
      PENDING = "Pending"
      INVOICED = "Invoiced"
      PAID = "Paid"
      # Every value this version of the library knows. The API may add more.
      VALUES = [NOT_BILLED, PENDING, INVOICED, PAID].freeze
    end

    # The caregiver's response to the assignment.
    module VisitCaregiverRsvp
      CONFIRMED = "confirmed"
      DECLINED = "declined"
      # Every value this version of the library knows. The API may add more.
      VALUES = [CONFIRMED, DECLINED].freeze
    end

    # Whether office staff (`User`) or a caregiver wrote the note. Set from the API key's user.
    module VisitNoteAuthorType
      USER = "User"
      CAREGIVER = "Caregiver"
      # Every value this version of the library knows. The API may add more.
      VALUES = [USER, CAREGIVER].freeze
    end

    # Where the request stands. A caregiver's key creates `Pending` requests and can only change
    # its own pending request to `Cancelled`; approving and denying is for office staff.
    module VisitRequestStatus
      PENDING = "Pending"
      APPROVED = "Approved"
      DENIED = "Denied"
      CANCELLED = "Cancelled"
      # Every value this version of the library knows. The API may add more.
      VALUES = [PENDING, APPROVED, DENIED, CANCELLED].freeze
    end

    # Whether the offer is still open.
    module OpenShiftStatus
      ACTIVE = "Active"
      FILLED = "Filled"
      CANCELLED = "Cancelled"
      # Every value this version of the library knows. The API may add more.
      VALUES = [ACTIVE, FILLED, CANCELLED].freeze
    end

    # Where the swap stands. With a caregiver's key: new swaps are `Pending`; the asked caregiver
    # changes a `Pending` swap to `Accepted` or `Declined`; the requesting caregiver can change it
    # to `Cancelled`. `AdminApproved` and `AdminDenied` are for office staff.
    module ShiftSwapStatus
      PENDING = "Pending"
      ACCEPTED = "Accepted"
      DECLINED = "Declined"
      CANCELLED = "Cancelled"
      ADMIN_APPROVED = "AdminApproved"
      ADMIN_DENIED = "AdminDenied"
      # Every value this version of the library knows. The API may add more.
      VALUES = [PENDING, ACCEPTED, DECLINED, CANCELLED, ADMIN_APPROVED, ADMIN_DENIED].freeze
    end

    # Where the plan is in its lifecycle.
    module CarePlanStatus
      ACTIVE = "Active"
      DRAFT = "Draft"
      ARCHIVED = "Archived"
      UNDER_REVIEW = "UnderReview"
      COMPLETED = "Completed"
      DISCONTINUED = "Discontinued"
      # Every value this version of the library knows. The API may add more.
      VALUES = [ACTIVE, DRAFT, ARCHIVED, UNDER_REVIEW, COMPLETED, DISCONTINUED].freeze
    end

    # Whether units count time, visits or days.
    module AuthorizationUnitBasis
      TIME = "Time"
      VISITS = "Visits"
      DAYS = "Days"
      # Every value this version of the library knows. The API may add more.
      VALUES = [TIME, VISITS, DAYS].freeze
    end

    # Whether the authorization is in effect.
    module AuthorizationStatus
      ACTIVE = "Active"
      EXPIRED = "Expired"
      PENDING_RENEWAL = "PendingRenewal"
      # Every value this version of the library knows. The API may add more.
      VALUES = [ACTIVE, EXPIRED, PENDING_RENEWAL].freeze
    end

    # Kind of incident.
    module IncidentCategory
      FALL = "Fall"
      MEDICATION = "Medication"
      BEHAVIORAL = "Behavioral"
      INJURY = "Injury"
      EQUIPMENT = "Equipment"
      ATTENDANCE = "Attendance"
      CONDUCT = "Conduct"
      OTHER = "Other"
      # Every value this version of the library knows. The API may add more.
      VALUES = [FALL, MEDICATION, BEHAVIORAL, INJURY, EQUIPMENT, ATTENDANCE, CONDUCT, OTHER].freeze
    end

    # How serious it was.
    module IncidentSeverity
      LOW = "Low"
      MEDIUM = "Medium"
      HIGH = "High"
      CRITICAL = "Critical"
      # Every value this version of the library knows. The API may add more.
      VALUES = [LOW, MEDIUM, HIGH, CRITICAL].freeze
    end

    # Where follow-up stands. New incidents start `Open`.
    module IncidentStatus
      OPEN = "Open"
      MONITORING = "Monitoring"
      AWAITING_FOLLOW_UP = "AwaitingFollowUp"
      RESOLVED = "Resolved"
      CLOSED = "Closed"
      # Every value this version of the library knows. The API may add more.
      VALUES = [OPEN, MONITORING, AWAITING_FOLLOW_UP, RESOLVED, CLOSED].freeze
    end

    # Where the referral stands.
    module ReferralStatus
      NEW = "New"
      CONTACTED = "Contacted"
      ASSESSMENT_SCHEDULED = "AssessmentScheduled"
      ASSESSMENT_COMPLETED = "AssessmentCompleted"
      SERVICE_AGREEMENT_SENT = "ServiceAgreementSent"
      ADMITTED = "Admitted"
      DECLINED = "Declined"
      LOST = "Lost"
      # Every value this version of the library knows. The API may add more.
      VALUES = [NEW, CONTACTED, ASSESSMENT_SCHEDULED, ASSESSMENT_COMPLETED, SERVICE_AGREEMENT_SENT, ADMITTED, DECLINED, LOST].freeze
    end

    # Payment status.
    module InvoiceStatus
      DRAFT = "Draft"
      PENDING = "Pending"
      PROCESSING = "Processing"
      PAID = "Paid"
      PARTIALLY_PAID = "PartiallyPaid"
      OVERDUE = "Overdue"
      CANCELLED = "Cancelled"
      REFUNDED = "Refunded"
      FAILED = "Failed"
      # Every value this version of the library knows. The API may add more.
      VALUES = [DRAFT, PENDING, PROCESSING, PAID, PARTIALLY_PAID, OVERDUE, CANCELLED, REFUNDED, FAILED].freeze
    end

    # Claim format: professional (837P) or institutional (837I).
    module ClaimClaimType
      PROFESSIONAL837_P = "Professional837P"
      INSTITUTIONAL837_I = "Institutional837I"
      # Every value this version of the library knows. The API may add more.
      VALUES = [PROFESSIONAL837_P, INSTITUTIONAL837_I].freeze
    end

    # Where the claim is in adjudication.
    module ClaimStatus
      DRAFT = "Draft"
      VALIDATED = "Validated"
      VALIDATION_FAILED = "ValidationFailed"
      SUBMITTED = "Submitted"
      ACKNOWLEDGED = "Acknowledged"
      ACCEPTED = "Accepted"
      REJECTED = "Rejected"
      IN_ADJUDICATION = "InAdjudication"
      PAID = "Paid"
      PARTIALLY_PAID = "PartiallyPaid"
      DENIED = "Denied"
      APPEALED = "Appealed"
      VOIDED = "Voided"
      # Every value this version of the library knows. The API may add more.
      VALUES = [DRAFT, VALIDATED, VALIDATION_FAILED, SUBMITTED, ACKNOWLEDGED, ACCEPTED, REJECTED, IN_ADJUDICATION, PAID, PARTIALLY_PAID, DENIED, APPEALED, VOIDED].freeze
    end

    # Where the entry is in your payroll process.
    module PayrollEntryStatus
      PENDING = "Pending"
      APPROVED = "Approved"
      PROCESSED = "Processed"
      PAID = "Paid"
      CANCELLED = "Cancelled"
      FAILED = "Failed"
      HOURS_SUBMITTED = "HoursSubmitted"
      CHECK_CREATED = "CheckCreated"
      PAID_CONFIRMED = "PaidConfirmed"
      PAID_EXTERNALLY = "PaidExternally"
      VOIDED = "Voided"
      # Every value this version of the library knows. The API may add more.
      VALUES = [PENDING, APPROVED, PROCESSED, PAID, CANCELLED, FAILED, HOURS_SUBMITTED, CHECK_CREATED, PAID_CONFIRMED, PAID_EXTERNALLY, VOIDED].freeze
    end

    # How the caregiver is paid.
    module PayrollEntryPaymentMethod
      DIRECT_DEPOSIT = "DirectDeposit"
      CHECK = "Check"
      MANUAL = "Manual"
      ACH = "ACH"
      # Every value this version of the library knows. The API may add more.
      VALUES = [DIRECT_DEPOSIT, CHECK, MANUAL, ACH].freeze
    end

    # How prominently the alert is shown.
    module AlertType
      CRITICAL = "Critical"
      IMPORTANT = "Important"
      NOTICE = "Notice"
      # Every value this version of the library knows. The API may add more.
      VALUES = [CRITICAL, IMPORTANT, NOTICE].freeze
    end

    # Who sees the alert. `Caregiver`, `Patient`, `Visit` and `PatientCareTeam` need
    # `audienceTargetId`.
    module AlertAudience
      COMPANY_WIDE = "CompanyWide"
      STAFF_ONLY = "StaffOnly"
      CAREGIVERS_ALL = "CaregiversAll"
      PATIENTS_ALL = "PatientsAll"
      CAREGIVER = "Caregiver"
      PATIENT = "Patient"
      VISIT = "Visit"
      PATIENT_CARE_TEAM = "PatientCareTeam"
      # Every value this version of the library knows. The API may add more.
      VALUES = [COMPANY_WIDE, STAFF_ONLY, CAREGIVERS_ALL, PATIENTS_ALL, CAREGIVER, PATIENT, VISIT, PATIENT_CARE_TEAM].freeze
    end

    # MeScope
    module MeScope
      READ = "read"
      WRITE = "write"
      # Every value this version of the library knows. The API may add more.
      VALUES = [READ, WRITE].freeze
    end

    # Role of the person the key belongs to: `RootUser` (agency administrator), `User` (office
    # staff), `Caregiver` or `Patient`. It decides which resources the key can reach.
    module MeRole
      ROOT_USER = "RootUser"
      USER = "User"
      CAREGIVER = "Caregiver"
      PATIENT = "Patient"
      # Every value this version of the library knows. The API may add more.
      VALUES = [ROOT_USER, USER, CAREGIVER, PATIENT].freeze
    end

    # Patients are the clients your agency provides care to, including prospective clients you
    # have not yet admitted. Every field is always present; a field with no value is `null`.
    class Patient < Model
      # String representing the object's type. Always `patient`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the patient.
      # @return [String, nil]
      attribute :id, "id"
      # Given name.
      # @return [String, nil]
      attribute :first_name, "firstName"
      # Middle name.
      # @return [String, nil]
      attribute :middle_name, "middleName"
      # Family name.
      # @return [String, nil]
      attribute :last_name, "lastName"
      # The name the patient prefers to be called.
      # @return [String, nil]
      attribute :goes_by_name, "goesByName"
      # Date of birth.
      # @return [String, nil]
      attribute :date_of_birth, "dateOfBirth"
      # Gender as recorded by the agency.
      # @return [String, nil]
      attribute :gender, "gender"
      # Language the patient is most comfortable speaking.
      # @return [String, nil]
      attribute :primary_language, "primaryLanguage"
      # Contact email address.
      # @return [String, nil]
      attribute :email, "email"
      # Whether the patient is an active client. Only active clients are scheduled and billed. A
      # prospective client is always inactive. If you leave it out on create, it is `false` for a
      # prospect or an `Inactive` or `Discharged` status and `true` otherwise.
      # @return [Boolean, nil]
      attribute :active, "active"
      # The client's status as shown in AveeCare. `Inactive` and `Discharged` mean the person is
      # no longer receiving care. A prospective client (`lifecycleStage: Prospect`) reads
      # `Prospect` even if you send `Active`. Creating a patient with `Prospect` makes them a
      # prospective client. Defaults to `Active`. Usually one of `Active`, `Inactive`, `Prospect`,
      # `Discharged`; records imported from another system can hold other values.
      # @return [String, nil]
      attribute :status, "status"
      # Whether this person is a prospective client or an admitted client. `null` means client.
      # Prospects appear in the prospective-patient pool in AveeCare, not on the patient roster.
      # @return [String, nil]
      attribute :lifecycle_stage, "lifecycleStage"
      # The main type of service the patient receives.
      # @return [String, nil]
      attribute :service_type, "serviceType"
      # Street address where care is delivered.
      # @return [String, nil]
      attribute :address, "address"
      # City of the service address.
      # @return [String, nil]
      attribute :city, "city"
      # State of the service address, as a two-letter code.
      # @return [String, nil]
      attribute :state, "state"
      # ZIP code of the service address.
      # @return [String, nil]
      attribute :zip_code, "zipCode"
      # The office (branch) that serves this patient.
      # @return [String, nil]
      attribute :office_id, "officeId"
      # The referral source that sent this patient to you.
      # @return [String, nil]
      attribute :referral_source_id, "referralSourceId"
      # Primary diagnosis, in plain words.
      # @return [String, nil]
      attribute :primary_diagnosis_description, "primaryDiagnosisDescription"
      # Whether the patient is a fall risk.
      # @return [Boolean, nil]
      attribute :fall_risk, "fallRisk"
      # Caregiver gender the patient prefers, if any.
      # @return [String, nil]
      attribute :preferred_caregiver_gender, "preferredCaregiverGender"
      # Notes schedulers see when booking visits for this patient.
      # @return [String, nil]
      attribute :scheduling_notes, "schedulingNotes"
      # Person legally responsible for the patient, if not the patient.
      # @return [String, nil]
      attribute :responsible_party_name, "responsiblePartyName"
      # Medicaid member ID.
      # @return [String, nil]
      attribute :medicaid_id, "medicaidId"
      # Medicare beneficiary identifier.
      # @return [String, nil]
      attribute :medicare_id, "medicareId"
      # Primary insurance company name.
      # @return [String, nil]
      attribute :insurance_provider, "insuranceProvider"
      # Member ID with the primary insurance.
      # @return [String, nil]
      attribute :insurance_id, "insuranceId"
      # Group number with the primary insurance.
      # @return [String, nil]
      attribute :insurance_group_number, "insuranceGroupNumber"
      # Who receives the bills.
      # @return [String, nil]
      attribute :billing_contact_name, "billingContactName"
      # Email address bills are sent to.
      # @return [String, nil]
      attribute :billing_contact_email, "billingContactEmail"
      # Phone number of the billing contact.
      # @return [String, nil]
      attribute :billing_contact_phone, "billingContactPhone"
      # How statements are delivered.
      # @return [String, nil]
      attribute :statement_delivery, "statementDelivery"
      # How the patient usually pays.
      # @return [String, nil]
      attribute :payment_method_preference, "paymentMethodPreference"
      # Balance the patient currently owes. In cents.
      # @return [Integer, nil]
      attribute :outstanding_balance_cents, "outstandingBalanceCents"
      # When the patient was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the patient was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new patient. Any other field is refused with `unknown_field`.
    class PatientCreate < Model
      # Given name.
      # @return [String, nil]
      attribute :first_name, "firstName"
      # Middle name.
      # @return [String, nil]
      attribute :middle_name, "middleName"
      # Family name.
      # @return [String, nil]
      attribute :last_name, "lastName"
      # The name the patient prefers to be called.
      # @return [String, nil]
      attribute :goes_by_name, "goesByName"
      # Date of birth.
      # @return [String, nil]
      attribute :date_of_birth, "dateOfBirth"
      # Gender as recorded by the agency.
      # @return [String, nil]
      attribute :gender, "gender"
      # Language the patient is most comfortable speaking.
      # @return [String, nil]
      attribute :primary_language, "primaryLanguage"
      # Contact email address.
      # @return [String, nil]
      attribute :email, "email"
      # Whether the patient is an active client. Only active clients are scheduled and billed. A
      # prospective client is always inactive. If you leave it out on create, it is `false` for a
      # prospect or an `Inactive` or `Discharged` status and `true` otherwise.
      # @return [Boolean, nil]
      attribute :active, "active"
      # The client's status as shown in AveeCare. `Inactive` and `Discharged` mean the person is
      # no longer receiving care. A prospective client (`lifecycleStage: Prospect`) reads
      # `Prospect` even if you send `Active`. Creating a patient with `Prospect` makes them a
      # prospective client. Defaults to `Active`.
      # @return [String, nil]
      attribute :status, "status"
      # Whether this person is a prospective client or an admitted client. `null` means client.
      # Prospects appear in the prospective-patient pool in AveeCare, not on the patient roster.
      # @return [String, nil]
      attribute :lifecycle_stage, "lifecycleStage"
      # The main type of service the patient receives.
      # @return [String, nil]
      attribute :service_type, "serviceType"
      # Street address where care is delivered.
      # @return [String, nil]
      attribute :address, "address"
      # City of the service address.
      # @return [String, nil]
      attribute :city, "city"
      # State of the service address, as a two-letter code.
      # @return [String, nil]
      attribute :state, "state"
      # ZIP code of the service address.
      # @return [String, nil]
      attribute :zip_code, "zipCode"
      # The office (branch) that serves this patient.
      # @return [String, nil]
      attribute :office_id, "officeId"
      # The referral source that sent this patient to you.
      # @return [String, nil]
      attribute :referral_source_id, "referralSourceId"
      # Primary diagnosis, in plain words.
      # @return [String, nil]
      attribute :primary_diagnosis_description, "primaryDiagnosisDescription"
      # Whether the patient is a fall risk.
      # @return [Boolean, nil]
      attribute :fall_risk, "fallRisk"
      # Caregiver gender the patient prefers, if any.
      # @return [String, nil]
      attribute :preferred_caregiver_gender, "preferredCaregiverGender"
      # Notes schedulers see when booking visits for this patient.
      # @return [String, nil]
      attribute :scheduling_notes, "schedulingNotes"
      # Person legally responsible for the patient, if not the patient.
      # @return [String, nil]
      attribute :responsible_party_name, "responsiblePartyName"
      # Medicaid member ID.
      # @return [String, nil]
      attribute :medicaid_id, "medicaidId"
      # Medicare beneficiary identifier.
      # @return [String, nil]
      attribute :medicare_id, "medicareId"
      # Primary insurance company name.
      # @return [String, nil]
      attribute :insurance_provider, "insuranceProvider"
      # Member ID with the primary insurance.
      # @return [String, nil]
      attribute :insurance_id, "insuranceId"
      # Group number with the primary insurance.
      # @return [String, nil]
      attribute :insurance_group_number, "insuranceGroupNumber"
      # Who receives the bills.
      # @return [String, nil]
      attribute :billing_contact_name, "billingContactName"
      # Email address bills are sent to.
      # @return [String, nil]
      attribute :billing_contact_email, "billingContactEmail"
      # Phone number of the billing contact.
      # @return [String, nil]
      attribute :billing_contact_phone, "billingContactPhone"
      # How statements are delivered.
      # @return [String, nil]
      attribute :statement_delivery, "statementDelivery"
      # How the patient usually pays.
      # @return [String, nil]
      attribute :payment_method_preference, "paymentMethodPreference"
    end

    # Fields to change on a patient. Send only the fields to change; any other field is refused
    # with `unknown_field`.
    class PatientUpdate < Model
      # Given name.
      # @return [String, nil]
      attribute :first_name, "firstName"
      # Middle name.
      # @return [String, nil]
      attribute :middle_name, "middleName"
      # Family name.
      # @return [String, nil]
      attribute :last_name, "lastName"
      # The name the patient prefers to be called.
      # @return [String, nil]
      attribute :goes_by_name, "goesByName"
      # Date of birth.
      # @return [String, nil]
      attribute :date_of_birth, "dateOfBirth"
      # Gender as recorded by the agency.
      # @return [String, nil]
      attribute :gender, "gender"
      # Language the patient is most comfortable speaking.
      # @return [String, nil]
      attribute :primary_language, "primaryLanguage"
      # Contact email address.
      # @return [String, nil]
      attribute :email, "email"
      # Whether the patient is an active client. Only active clients are scheduled and billed. A
      # prospective client is always inactive. If you leave it out on create, it is `false` for a
      # prospect or an `Inactive` or `Discharged` status and `true` otherwise.
      # @return [Boolean, nil]
      attribute :active, "active"
      # The client's status as shown in AveeCare. `Inactive` and `Discharged` mean the person is
      # no longer receiving care. A prospective client (`lifecycleStage: Prospect`) reads
      # `Prospect` even if you send `Active`. Creating a patient with `Prospect` makes them a
      # prospective client. Defaults to `Active`.
      # @return [String, nil]
      attribute :status, "status"
      # Whether this person is a prospective client or an admitted client. `null` means client.
      # Prospects appear in the prospective-patient pool in AveeCare, not on the patient roster.
      # @return [String, nil]
      attribute :lifecycle_stage, "lifecycleStage"
      # The main type of service the patient receives.
      # @return [String, nil]
      attribute :service_type, "serviceType"
      # Street address where care is delivered.
      # @return [String, nil]
      attribute :address, "address"
      # City of the service address.
      # @return [String, nil]
      attribute :city, "city"
      # State of the service address, as a two-letter code.
      # @return [String, nil]
      attribute :state, "state"
      # ZIP code of the service address.
      # @return [String, nil]
      attribute :zip_code, "zipCode"
      # The office (branch) that serves this patient.
      # @return [String, nil]
      attribute :office_id, "officeId"
      # The referral source that sent this patient to you.
      # @return [String, nil]
      attribute :referral_source_id, "referralSourceId"
      # Primary diagnosis, in plain words.
      # @return [String, nil]
      attribute :primary_diagnosis_description, "primaryDiagnosisDescription"
      # Whether the patient is a fall risk.
      # @return [Boolean, nil]
      attribute :fall_risk, "fallRisk"
      # Caregiver gender the patient prefers, if any.
      # @return [String, nil]
      attribute :preferred_caregiver_gender, "preferredCaregiverGender"
      # Notes schedulers see when booking visits for this patient.
      # @return [String, nil]
      attribute :scheduling_notes, "schedulingNotes"
      # Person legally responsible for the patient, if not the patient.
      # @return [String, nil]
      attribute :responsible_party_name, "responsiblePartyName"
      # Medicaid member ID.
      # @return [String, nil]
      attribute :medicaid_id, "medicaidId"
      # Medicare beneficiary identifier.
      # @return [String, nil]
      attribute :medicare_id, "medicareId"
      # Primary insurance company name.
      # @return [String, nil]
      attribute :insurance_provider, "insuranceProvider"
      # Member ID with the primary insurance.
      # @return [String, nil]
      attribute :insurance_id, "insuranceId"
      # Group number with the primary insurance.
      # @return [String, nil]
      attribute :insurance_group_number, "insuranceGroupNumber"
      # Who receives the bills.
      # @return [String, nil]
      attribute :billing_contact_name, "billingContactName"
      # Email address bills are sent to.
      # @return [String, nil]
      attribute :billing_contact_email, "billingContactEmail"
      # Phone number of the billing contact.
      # @return [String, nil]
      attribute :billing_contact_phone, "billingContactPhone"
      # How statements are delivered.
      # @return [String, nil]
      attribute :statement_delivery, "statementDelivery"
      # How the patient usually pays.
      # @return [String, nil]
      attribute :payment_method_preference, "paymentMethodPreference"
    end

    # Confirmation that a patient was deleted.
    class PatientDeleted < Model
      # Always `patient`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted patient.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Contacts are family members and other people connected to a patient, such as an emergency
    # contact. Every field is always present; a field with no value is `null`.
    class Contact < Model
      # String representing the object's type. Always `contact`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the contact.
      # @return [String, nil]
      attribute :id, "id"
      # The patient this contact belongs to.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # Full name.
      # @return [String, nil]
      attribute :name, "name"
      # Relationship to the patient.
      # @return [String, nil]
      attribute :relationship, "relationship"
      # Phone number.
      # @return [String, nil]
      attribute :phone_number, "phoneNumber"
      # Email address.
      # @return [String, nil]
      attribute :email, "email"
      # Whether the contact prefers email over phone.
      # @return [Boolean, nil]
      attribute :prefer_email, "preferEmail"
      # Whether this person is an emergency contact.
      # @return [Boolean, nil]
      attribute :emergency_contact, "emergencyContact"
      # Which updates the contact is notified about.
      # @return [String, nil]
      attribute :notification_policy, "notificationPolicy"
      # When the contact was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the contact was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new contact. Any other field is refused with `unknown_field`.
    class ContactCreate < Model
      # The patient this contact belongs to.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # Full name.
      # @return [String, nil]
      attribute :name, "name"
      # Relationship to the patient.
      # @return [String, nil]
      attribute :relationship, "relationship"
      # Phone number.
      # @return [String, nil]
      attribute :phone_number, "phoneNumber"
      # Email address.
      # @return [String, nil]
      attribute :email, "email"
      # Whether the contact prefers email over phone.
      # @return [Boolean, nil]
      attribute :prefer_email, "preferEmail"
      # Whether this person is an emergency contact.
      # @return [Boolean, nil]
      attribute :emergency_contact, "emergencyContact"
      # Which updates the contact is notified about.
      # @return [String, nil]
      attribute :notification_policy, "notificationPolicy"
    end

    # Fields to change on a contact. Send only the fields to change; any other field is refused
    # with `unknown_field`. `patientId` is set when the contact is created and cannot be changed
    # afterwards.
    class ContactUpdate < Model
      # Full name.
      # @return [String, nil]
      attribute :name, "name"
      # Relationship to the patient.
      # @return [String, nil]
      attribute :relationship, "relationship"
      # Phone number.
      # @return [String, nil]
      attribute :phone_number, "phoneNumber"
      # Email address.
      # @return [String, nil]
      attribute :email, "email"
      # Whether the contact prefers email over phone.
      # @return [Boolean, nil]
      attribute :prefer_email, "preferEmail"
      # Whether this person is an emergency contact.
      # @return [Boolean, nil]
      attribute :emergency_contact, "emergencyContact"
      # Which updates the contact is notified about.
      # @return [String, nil]
      attribute :notification_policy, "notificationPolicy"
    end

    # Confirmation that a contact was deleted.
    class ContactDeleted < Model
      # Always `contact`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted contact.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Allergies recorded on a patient's profile. Every field is always present; a field with no
    # value is `null`.
    class Allergy < Model
      # String representing the object's type. Always `allergy`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the allergy.
      # @return [String, nil]
      attribute :id, "id"
      # The patient who has this allergy.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # What the patient is allergic to.
      # @return [String, nil]
      attribute :name, "name"
      # Reaction and other details.
      # @return [String, nil]
      attribute :description, "description"
      # When the allergy was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the allergy was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new allergy. Any other field is refused with `unknown_field`.
    class AllergyCreate < Model
      # The patient who has this allergy.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # What the patient is allergic to.
      # @return [String, nil]
      attribute :name, "name"
      # Reaction and other details.
      # @return [String, nil]
      attribute :description, "description"
    end

    # Fields to change on an allergy. Send only the fields to change; any other field is refused
    # with `unknown_field`. `patientId` is set when the allergy is created and cannot be changed
    # afterwards.
    class AllergyUpdate < Model
      # What the patient is allergic to.
      # @return [String, nil]
      attribute :name, "name"
      # Reaction and other details.
      # @return [String, nil]
      attribute :description, "description"
    end

    # Confirmation that an allergy was deleted.
    class AllergyDeleted < Model
      # Always `allergy`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted allergy.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Medications on a patient's medication list, with the schedule caregivers follow when they
    # give or assist with them. Every field is always present; a field with no value is `null`.
    class Medication < Model
      # String representing the object's type. Always `medication`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the medication.
      # @return [String, nil]
      attribute :id, "id"
      # The patient who takes this medication.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # Drug name, without the strength.
      # @return [String, nil]
      attribute :name, "name"
      # Strength per dose unit.
      # @return [String, nil]
      attribute :strength, "strength"
      # Dose form.
      # @return [String, nil]
      attribute :form, "form"
      # How it is taken.
      # @return [String, nil]
      attribute :route, "route"
      # Directions as written on the prescription.
      # @return [String, nil]
      attribute :directions, "directions"
      # What the medication is for.
      # @return [String, nil]
      attribute :indication, "indication"
      # `Scheduled` for regular doses, `PRN` for as-needed.
      # @return [String, nil]
      attribute :schedule_type, "scheduleType"
      # For as-needed medications, when to give it.
      # @return [String, nil]
      attribute :prn_reason, "prnReason"
      # For as-needed medications, the most doses allowed in a day.
      # @return [Integer, nil]
      attribute :prn_max_daily_doses, "prnMaxDailyDoses"
      # For as-needed medications, the minimum hours between doses.
      # @return [Float, nil]
      attribute :prn_min_interval_hours, "prnMinIntervalHours"
      # Date the patient started the medication.
      # @return [String, nil]
      attribute :start_date, "startDate"
      # Whether the medication is currently given.
      # @return [String, nil]
      attribute :status, "status"
      # Date the medication was stopped.
      # @return [String, nil]
      attribute :discontinued_date, "discontinuedDate"
      # Why the medication was stopped.
      # @return [String, nil]
      attribute :discontinued_reason, "discontinuedReason"
      # Prescribing clinician.
      # @return [String, nil]
      attribute :prescriber, "prescriber"
      # Prescriber's phone number.
      # @return [String, nil]
      attribute :prescriber_phone, "prescriberPhone"
      # Pharmacy that fills the prescription.
      # @return [String, nil]
      attribute :pharmacy, "pharmacy"
      # Pharmacy phone number.
      # @return [String, nil]
      attribute :pharmacy_phone, "pharmacyPhone"
      # Whether a second person must witness each dose.
      # @return [Boolean, nil]
      attribute :requires_witness, "requiresWitness"
      # Doses currently on hand.
      # @return [Float, nil]
      attribute :quantity_on_hand, "quantityOnHand"
      # Refills left on the prescription.
      # @return [Integer, nil]
      attribute :refills_remaining, "refillsRemaining"
      # Other notes.
      # @return [String, nil]
      attribute :notes, "notes"
      # When the medication was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the medication was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new medication. Any other field is refused with `unknown_field`.
    class MedicationCreate < Model
      # The patient who takes this medication.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # Drug name, without the strength.
      # @return [String, nil]
      attribute :name, "name"
      # Strength per dose unit.
      # @return [String, nil]
      attribute :strength, "strength"
      # Dose form.
      # @return [String, nil]
      attribute :form, "form"
      # How it is taken.
      # @return [String, nil]
      attribute :route, "route"
      # Directions as written on the prescription.
      # @return [String, nil]
      attribute :directions, "directions"
      # What the medication is for.
      # @return [String, nil]
      attribute :indication, "indication"
      # `Scheduled` for regular doses, `PRN` for as-needed.
      # @return [String, nil]
      attribute :schedule_type, "scheduleType"
      # For as-needed medications, when to give it.
      # @return [String, nil]
      attribute :prn_reason, "prnReason"
      # For as-needed medications, the most doses allowed in a day.
      # @return [Integer, nil]
      attribute :prn_max_daily_doses, "prnMaxDailyDoses"
      # For as-needed medications, the minimum hours between doses.
      # @return [Float, nil]
      attribute :prn_min_interval_hours, "prnMinIntervalHours"
      # Date the patient started the medication.
      # @return [String, nil]
      attribute :start_date, "startDate"
      # Whether the medication is currently given.
      # @return [String, nil]
      attribute :status, "status"
      # Date the medication was stopped.
      # @return [String, nil]
      attribute :discontinued_date, "discontinuedDate"
      # Why the medication was stopped.
      # @return [String, nil]
      attribute :discontinued_reason, "discontinuedReason"
      # Prescribing clinician.
      # @return [String, nil]
      attribute :prescriber, "prescriber"
      # Prescriber's phone number.
      # @return [String, nil]
      attribute :prescriber_phone, "prescriberPhone"
      # Pharmacy that fills the prescription.
      # @return [String, nil]
      attribute :pharmacy, "pharmacy"
      # Pharmacy phone number.
      # @return [String, nil]
      attribute :pharmacy_phone, "pharmacyPhone"
      # Whether a second person must witness each dose.
      # @return [Boolean, nil]
      attribute :requires_witness, "requiresWitness"
      # Doses currently on hand.
      # @return [Float, nil]
      attribute :quantity_on_hand, "quantityOnHand"
      # Refills left on the prescription.
      # @return [Integer, nil]
      attribute :refills_remaining, "refillsRemaining"
      # Other notes.
      # @return [String, nil]
      attribute :notes, "notes"
    end

    # Fields to change on a medication. Send only the fields to change; any other field is refused
    # with `unknown_field`. `patientId` is set when the medication is created and cannot be
    # changed afterwards.
    class MedicationUpdate < Model
      # Drug name, without the strength.
      # @return [String, nil]
      attribute :name, "name"
      # Strength per dose unit.
      # @return [String, nil]
      attribute :strength, "strength"
      # Dose form.
      # @return [String, nil]
      attribute :form, "form"
      # How it is taken.
      # @return [String, nil]
      attribute :route, "route"
      # Directions as written on the prescription.
      # @return [String, nil]
      attribute :directions, "directions"
      # What the medication is for.
      # @return [String, nil]
      attribute :indication, "indication"
      # `Scheduled` for regular doses, `PRN` for as-needed.
      # @return [String, nil]
      attribute :schedule_type, "scheduleType"
      # For as-needed medications, when to give it.
      # @return [String, nil]
      attribute :prn_reason, "prnReason"
      # For as-needed medications, the most doses allowed in a day.
      # @return [Integer, nil]
      attribute :prn_max_daily_doses, "prnMaxDailyDoses"
      # For as-needed medications, the minimum hours between doses.
      # @return [Float, nil]
      attribute :prn_min_interval_hours, "prnMinIntervalHours"
      # Date the patient started the medication.
      # @return [String, nil]
      attribute :start_date, "startDate"
      # Whether the medication is currently given.
      # @return [String, nil]
      attribute :status, "status"
      # Date the medication was stopped.
      # @return [String, nil]
      attribute :discontinued_date, "discontinuedDate"
      # Why the medication was stopped.
      # @return [String, nil]
      attribute :discontinued_reason, "discontinuedReason"
      # Prescribing clinician.
      # @return [String, nil]
      attribute :prescriber, "prescriber"
      # Prescriber's phone number.
      # @return [String, nil]
      attribute :prescriber_phone, "prescriberPhone"
      # Pharmacy that fills the prescription.
      # @return [String, nil]
      attribute :pharmacy, "pharmacy"
      # Pharmacy phone number.
      # @return [String, nil]
      attribute :pharmacy_phone, "pharmacyPhone"
      # Whether a second person must witness each dose.
      # @return [Boolean, nil]
      attribute :requires_witness, "requiresWitness"
      # Doses currently on hand.
      # @return [Float, nil]
      attribute :quantity_on_hand, "quantityOnHand"
      # Refills left on the prescription.
      # @return [Integer, nil]
      attribute :refills_remaining, "refillsRemaining"
      # Other notes.
      # @return [String, nil]
      attribute :notes, "notes"
    end

    # Confirmation that a medication was deleted.
    class MedicationDeleted < Model
      # Always `medication`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted medication.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Goals of care set for a patient, such as walking to the mailbox unaided. Every field is
    # always present; a field with no value is `null`.
    class CareGoal < Model
      # String representing the object's type. Always `care_goal`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the care goal.
      # @return [String, nil]
      attribute :id, "id"
      # The patient this goal is for.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # Short name of the goal.
      # @return [String, nil]
      attribute :name, "name"
      # What success looks like.
      # @return [String, nil]
      attribute :description, "description"
      # When the care goal was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the care goal was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new care goal. Any other field is refused with `unknown_field`.
    class CareGoalCreate < Model
      # The patient this goal is for.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # Short name of the goal.
      # @return [String, nil]
      attribute :name, "name"
      # What success looks like.
      # @return [String, nil]
      attribute :description, "description"
    end

    # Fields to change on a care goal. Send only the fields to change; any other field is refused
    # with `unknown_field`. `patientId` is set when the care goal is created and cannot be changed
    # afterwards.
    class CareGoalUpdate < Model
      # Short name of the goal.
      # @return [String, nil]
      attribute :name, "name"
      # What success looks like.
      # @return [String, nil]
      attribute :description, "description"
    end

    # Confirmation that a care goal was deleted.
    class CareGoalDeleted < Model
      # Always `care_goal`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted care goal.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Notes your staff and caregivers keep on a patient's profile. Every field is always present;
    # a field with no value is `null`.
    class PatientNote < Model
      # String representing the object's type. Always `patient_note`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the patient note.
      # @return [String, nil]
      attribute :id, "id"
      # The patient the note is about.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # The note.
      # @return [String, nil]
      attribute :content, "content"
      # The person who wrote the note. Set to the API key's user.
      # @return [String, nil]
      attribute :author_id, "authorId"
      # Display name of the author.
      # @return [String, nil]
      attribute :author_name, "authorName"
      # When the patient note was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the patient note was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new patient note. Any other field is refused with `unknown_field`.
    class PatientNoteCreate < Model
      # The patient the note is about.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # The note.
      # @return [String, nil]
      attribute :content, "content"
    end

    # Fields to change on a patient note. Send only the fields to change; any other field is
    # refused with `unknown_field`. `patientId` is set when the patient note is created and cannot
    # be changed afterwards.
    class PatientNoteUpdate < Model
      # The note.
      # @return [String, nil]
      attribute :content, "content"
    end

    # Confirmation that a patient note was deleted.
    class PatientNoteDeleted < Model
      # Always `patient_note`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted patient note.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # The medication administration record (MAR): each dose a caregiver gave, or the reason it was
    # not given. Read-only. Every field is always present; a field with no value is `null`.
    class MedicationAdministration < Model
      # String representing the object's type. Always `medication_administration`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the medication administration.
      # @return [String, nil]
      attribute :id, "id"
      # The medication this dose was for.
      # @return [String, nil]
      attribute :medication_id, "medicationId"
      # The patient.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # The visit during which the dose was recorded.
      # @return [String, nil]
      attribute :visit_id, "visitId"
      # Date the dose was due.
      # @return [String, nil]
      attribute :scheduled_date, "scheduledDate"
      # Time slot the dose was due, as `HH:MM`.
      # @return [String, nil]
      attribute :scheduled_slot, "scheduledSlot"
      # What happened to the dose.
      # @return [String, nil]
      attribute :status, "status"
      # When the dose was given.
      # @return [String, nil]
      attribute :administered_at, "administeredAt"
      # Who gave or recorded the dose.
      # @return [String, nil]
      attribute :administered_by_name, "administeredByName"
      # Why the dose was refused, held or missed.
      # @return [String, nil]
      attribute :reason_text, "reasonText"
      # Note recorded with the dose.
      # @return [String, nil]
      attribute :note, "note"
      # Witness, for medications that require one.
      # @return [String, nil]
      attribute :witness_name, "witnessName"
      # For as-needed doses, why it was given.
      # @return [String, nil]
      attribute :prn_reason, "prnReason"
      # Whether this entry was later corrected.
      # @return [Boolean, nil]
      attribute :amended, "amended"
      # When the medication administration was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the medication administration was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # OASIS assessments recorded for Medicare home health patients. This lists each assessment and
    # its status; the item-level answers are not included. Read-only. Every field is always
    # present; a field with no value is `null`.
    class OasisAssessment < Model
      # String representing the object's type. Always `oasis_assessment`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the OASIS assessment.
      # @return [String, nil]
      attribute :id, "id"
      # The patient assessed.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # Which OASIS time point this assessment covers.
      # @return [String, nil]
      attribute :timepoint, "timepoint"
      # OASIS data set version.
      # @return [String, nil]
      attribute :spec_version, "specVersion"
      # Where the assessment is in its lifecycle.
      # @return [String, nil]
      attribute :status, "status"
      # Date the assessment was completed (OASIS item M0090).
      # @return [String, nil]
      attribute :m0090_completed_date, "m0090CompletedDate"
      # Start of the care episode.
      # @return [String, nil]
      attribute :episode_start_date, "episodeStartDate"
      # Date the assessment is due.
      # @return [String, nil]
      attribute :target_date, "targetDate"
      # Clinician who performed the assessment.
      # @return [String, nil]
      attribute :assessor_name, "assessorName"
      # When the assessment was marked complete.
      # @return [String, nil]
      attribute :completed_at, "completedAt"
      # When the assessment was exported for submission.
      # @return [String, nil]
      attribute :exported_at, "exportedAt"
      # Correction number; 0 for the original.
      # @return [Integer, nil]
      attribute :correction_number, "correctionNumber"
      # Notes on the assessment.
      # @return [String, nil]
      attribute :notes, "notes"
      # When the OASIS assessment was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the OASIS assessment was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Caregivers are the aides, nurses and therapists your agency schedules to visit patients.
    # Every field is always present; a field with no value is `null`.
    class Caregiver < Model
      # String representing the object's type. Always `caregiver`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the caregiver.
      # @return [String, nil]
      attribute :id, "id"
      # Given name.
      # @return [String, nil]
      attribute :first_name, "firstName"
      # Middle name.
      # @return [String, nil]
      attribute :middle_name, "middleName"
      # Family name.
      # @return [String, nil]
      attribute :last_name, "lastName"
      # The name the caregiver prefers to be called.
      # @return [String, nil]
      attribute :goes_by_name, "goesByName"
      # Work email address.
      # @return [String, nil]
      attribute :email, "email"
      # Employment status.
      # @return [String, nil]
      attribute :status, "status"
      # Whether the caregiver can be scheduled. If you leave it out on create, it is `false` for
      # an `Inactive` status and `true` otherwise.
      # @return [Boolean, nil]
      attribute :active, "active"
      # Date of birth.
      # @return [String, nil]
      attribute :date_of_birth, "dateOfBirth"
      # Gender as recorded by the agency.
      # @return [String, nil]
      attribute :gender, "gender"
      # Language the caregiver is most comfortable speaking.
      # @return [String, nil]
      attribute :primary_language, "primaryLanguage"
      # Home street address.
      # @return [String, nil]
      attribute :address, "address"
      # City.
      # @return [String, nil]
      attribute :city, "city"
      # State, as a two-letter code.
      # @return [String, nil]
      attribute :state, "state"
      # ZIP code.
      # @return [String, nil]
      attribute :zip_code, "zipCode"
      # The office (branch) the caregiver works from.
      # @return [String, nil]
      attribute :office_id, "officeId"
      # License or credential type.
      # @return [String, nil]
      attribute :license_type, "licenseType"
      # National Provider Identifier, for licensed clinicians.
      # @return [String, nil]
      attribute :npi_number, "npiNumber"
      # State license number.
      # @return [String, nil]
      attribute :state_license_number, "stateLicenseNumber"
      # State that issued the license.
      # @return [String, nil]
      attribute :state_license_state, "stateLicenseState"
      # License expiry date, as `YYYY-MM-DD`.
      # @return [String, nil]
      attribute :state_license_expiry, "stateLicenseExpiry"
      # Whether the caregiver works live-in shifts.
      # @return [Boolean, nil]
      attribute :is_live_in_caregiver, "isLiveInCaregiver"
      # Notes schedulers see when booking this caregiver.
      # @return [String, nil]
      attribute :scheduling_notes, "schedulingNotes"
      # Date of the caregiver's most recent visit.
      # @return [String, nil]
      attribute :last_visit, "lastVisit"
      # When the caregiver was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the caregiver was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new caregiver. Any other field is refused with `unknown_field`.
    class CaregiverCreate < Model
      # Given name.
      # @return [String, nil]
      attribute :first_name, "firstName"
      # Middle name.
      # @return [String, nil]
      attribute :middle_name, "middleName"
      # Family name.
      # @return [String, nil]
      attribute :last_name, "lastName"
      # The name the caregiver prefers to be called.
      # @return [String, nil]
      attribute :goes_by_name, "goesByName"
      # Work email address.
      # @return [String, nil]
      attribute :email, "email"
      # Employment status.
      # @return [String, nil]
      attribute :status, "status"
      # Whether the caregiver can be scheduled. If you leave it out on create, it is `false` for
      # an `Inactive` status and `true` otherwise.
      # @return [Boolean, nil]
      attribute :active, "active"
      # Date of birth.
      # @return [String, nil]
      attribute :date_of_birth, "dateOfBirth"
      # Gender as recorded by the agency.
      # @return [String, nil]
      attribute :gender, "gender"
      # Language the caregiver is most comfortable speaking.
      # @return [String, nil]
      attribute :primary_language, "primaryLanguage"
      # Home street address.
      # @return [String, nil]
      attribute :address, "address"
      # City.
      # @return [String, nil]
      attribute :city, "city"
      # State, as a two-letter code.
      # @return [String, nil]
      attribute :state, "state"
      # ZIP code.
      # @return [String, nil]
      attribute :zip_code, "zipCode"
      # The office (branch) the caregiver works from.
      # @return [String, nil]
      attribute :office_id, "officeId"
      # License or credential type.
      # @return [String, nil]
      attribute :license_type, "licenseType"
      # National Provider Identifier, for licensed clinicians.
      # @return [String, nil]
      attribute :npi_number, "npiNumber"
      # State license number.
      # @return [String, nil]
      attribute :state_license_number, "stateLicenseNumber"
      # State that issued the license.
      # @return [String, nil]
      attribute :state_license_state, "stateLicenseState"
      # License expiry date, as `YYYY-MM-DD`.
      # @return [String, nil]
      attribute :state_license_expiry, "stateLicenseExpiry"
      # Whether the caregiver works live-in shifts.
      # @return [Boolean, nil]
      attribute :is_live_in_caregiver, "isLiveInCaregiver"
      # Notes schedulers see when booking this caregiver.
      # @return [String, nil]
      attribute :scheduling_notes, "schedulingNotes"
    end

    # Fields to change on a caregiver. Send only the fields to change; any other field is refused
    # with `unknown_field`.
    class CaregiverUpdate < Model
      # Given name.
      # @return [String, nil]
      attribute :first_name, "firstName"
      # Middle name.
      # @return [String, nil]
      attribute :middle_name, "middleName"
      # Family name.
      # @return [String, nil]
      attribute :last_name, "lastName"
      # The name the caregiver prefers to be called.
      # @return [String, nil]
      attribute :goes_by_name, "goesByName"
      # Work email address.
      # @return [String, nil]
      attribute :email, "email"
      # Employment status.
      # @return [String, nil]
      attribute :status, "status"
      # Whether the caregiver can be scheduled. If you leave it out on create, it is `false` for
      # an `Inactive` status and `true` otherwise.
      # @return [Boolean, nil]
      attribute :active, "active"
      # Date of birth.
      # @return [String, nil]
      attribute :date_of_birth, "dateOfBirth"
      # Gender as recorded by the agency.
      # @return [String, nil]
      attribute :gender, "gender"
      # Language the caregiver is most comfortable speaking.
      # @return [String, nil]
      attribute :primary_language, "primaryLanguage"
      # Home street address.
      # @return [String, nil]
      attribute :address, "address"
      # City.
      # @return [String, nil]
      attribute :city, "city"
      # State, as a two-letter code.
      # @return [String, nil]
      attribute :state, "state"
      # ZIP code.
      # @return [String, nil]
      attribute :zip_code, "zipCode"
      # The office (branch) the caregiver works from.
      # @return [String, nil]
      attribute :office_id, "officeId"
      # License or credential type.
      # @return [String, nil]
      attribute :license_type, "licenseType"
      # National Provider Identifier, for licensed clinicians.
      # @return [String, nil]
      attribute :npi_number, "npiNumber"
      # State license number.
      # @return [String, nil]
      attribute :state_license_number, "stateLicenseNumber"
      # State that issued the license.
      # @return [String, nil]
      attribute :state_license_state, "stateLicenseState"
      # License expiry date, as `YYYY-MM-DD`.
      # @return [String, nil]
      attribute :state_license_expiry, "stateLicenseExpiry"
      # Whether the caregiver works live-in shifts.
      # @return [Boolean, nil]
      attribute :is_live_in_caregiver, "isLiveInCaregiver"
      # Notes schedulers see when booking this caregiver.
      # @return [String, nil]
      attribute :scheduling_notes, "schedulingNotes"
    end

    # Confirmation that a caregiver was deleted.
    class CaregiverDeleted < Model
      # Always `caregiver`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted caregiver.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Notes your staff keep on a caregiver's profile. Every field is always present; a field with
    # no value is `null`.
    class CaregiverNote < Model
      # String representing the object's type. Always `caregiver_note`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the caregiver note.
      # @return [String, nil]
      attribute :id, "id"
      # The caregiver the note is about.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # The note.
      # @return [String, nil]
      attribute :content, "content"
      # The person who wrote the note. Set to the API key's user.
      # @return [String, nil]
      attribute :author_id, "authorId"
      # Display name of the author.
      # @return [String, nil]
      attribute :author_name, "authorName"
      # When the caregiver note was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the caregiver note was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new caregiver note. Any other field is refused with `unknown_field`.
    class CaregiverNoteCreate < Model
      # The caregiver the note is about.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # The note.
      # @return [String, nil]
      attribute :content, "content"
    end

    # Fields to change on a caregiver note. Send only the fields to change; any other field is
    # refused with `unknown_field`. `caregiverId` is set when the caregiver note is created and
    # cannot be changed afterwards.
    class CaregiverNoteUpdate < Model
      # The note.
      # @return [String, nil]
      attribute :content, "content"
    end

    # Confirmation that a caregiver note was deleted.
    class CaregiverNoteDeleted < Model
      # Always `caregiver_note`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted caregiver note.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Certifications, licenses and background checks on a caregiver's profile, with their expiry
    # dates. Every field is always present; a field with no value is `null`.
    class Certification < Model
      # String representing the object's type. Always `certification`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the certification.
      # @return [String, nil]
      attribute :id, "id"
      # The caregiver who holds it.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # Name of the certification.
      # @return [String, nil]
      attribute :name, "name"
      # Kind of credential, such as a certification or a background check.
      # @return [String, nil]
      attribute :cert_kind, "certKind"
      # Date it was obtained.
      # @return [String, nil]
      attribute :obtained, "obtained"
      # Date it expires.
      # @return [String, nil]
      attribute :expires, "expires"
      # For background checks, the agency that ran the check.
      # @return [String, nil]
      attribute :check_agency, "checkAgency"
      # For background checks, the state the check covers.
      # @return [String, nil]
      attribute :check_state, "checkState"
      # For background checks, the result.
      # @return [String, nil]
      attribute :check_result, "checkResult"
      # Who verified the credential.
      # @return [String, nil]
      attribute :verified_by_name, "verifiedByName"
      # When the credential was verified.
      # @return [String, nil]
      attribute :verified_at, "verifiedAt"
      # When the certification was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the certification was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new certification. Any other field is refused with `unknown_field`.
    class CertificationCreate < Model
      # The caregiver who holds it.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # Name of the certification.
      # @return [String, nil]
      attribute :name, "name"
      # Kind of credential, such as a certification or a background check.
      # @return [String, nil]
      attribute :cert_kind, "certKind"
      # Date it was obtained.
      # @return [String, nil]
      attribute :obtained, "obtained"
      # Date it expires.
      # @return [String, nil]
      attribute :expires, "expires"
      # For background checks, the agency that ran the check.
      # @return [String, nil]
      attribute :check_agency, "checkAgency"
      # For background checks, the state the check covers.
      # @return [String, nil]
      attribute :check_state, "checkState"
      # For background checks, the result.
      # @return [String, nil]
      attribute :check_result, "checkResult"
    end

    # Fields to change on a certification. Send only the fields to change; any other field is
    # refused with `unknown_field`. `caregiverId` is set when the certification is created and
    # cannot be changed afterwards.
    class CertificationUpdate < Model
      # Name of the certification.
      # @return [String, nil]
      attribute :name, "name"
      # Kind of credential, such as a certification or a background check.
      # @return [String, nil]
      attribute :cert_kind, "certKind"
      # Date it was obtained.
      # @return [String, nil]
      attribute :obtained, "obtained"
      # Date it expires.
      # @return [String, nil]
      attribute :expires, "expires"
      # For background checks, the agency that ran the check.
      # @return [String, nil]
      attribute :check_agency, "checkAgency"
      # For background checks, the state the check covers.
      # @return [String, nil]
      attribute :check_state, "checkState"
      # For background checks, the result.
      # @return [String, nil]
      attribute :check_result, "checkResult"
    end

    # Confirmation that a certification was deleted.
    class CertificationDeleted < Model
      # Always `certification`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted certification.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # When a caregiver can or cannot work. A window is either a weekly recurring time on one
    # weekday, or a one-off date range such as time off. Every field is always present; a field
    # with no value is `null`.
    class Availability < Model
      # String representing the object's type. Always `availability`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the availability window.
      # @return [String, nil]
      attribute :id, "id"
      # The caregiver.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # `true` when the caregiver can work in this window, `false` for time off.
      # @return [Boolean, nil]
      attribute :is_available, "isAvailable"
      # Whether the window repeats weekly.
      # @return [Boolean, nil]
      attribute :recurring, "recurring"
      # For weekly windows, the weekday: 0 is Sunday, 6 is Saturday.
      # @return [Integer, nil]
      attribute :day_of_week, "dayOfWeek"
      # For weekly windows, the start time in minutes after midnight.
      # @return [Integer, nil]
      attribute :start_minute, "startMinute"
      # For weekly windows, the end time in minutes after midnight.
      # @return [Integer, nil]
      attribute :end_minute, "endMinute"
      # For weekly windows, repeat every this many weeks. Defaults to every week.
      # @return [Integer, nil]
      attribute :interval_weeks, "intervalWeeks"
      # First date a weekly window applies.
      # @return [String, nil]
      attribute :effective_from, "effectiveFrom"
      # Last date a weekly window applies; `null` for no end.
      # @return [String, nil]
      attribute :effective_to, "effectiveTo"
      # For one-off windows, when it starts.
      # @return [String, nil]
      attribute :start_date_time, "startDateTime"
      # For one-off windows, when it ends.
      # @return [String, nil]
      attribute :end_date_time, "endDateTime"
      # Whether these are the caregiver's preferred hours.
      # @return [Boolean, nil]
      attribute :is_preferred, "isPreferred"
      # Why the caregiver is unavailable, for time off.
      # @return [String, nil]
      attribute :reason, "reason"
      # Whether the window is in effect.
      # @return [Boolean, nil]
      attribute :is_active, "isActive"
      # When the availability window was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the availability window was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new availability window. Any other field is refused with `unknown_field`.
    class AvailabilityCreate < Model
      # The caregiver.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # `true` when the caregiver can work in this window, `false` for time off.
      # @return [Boolean, nil]
      attribute :is_available, "isAvailable"
      # Whether the window repeats weekly.
      # @return [Boolean, nil]
      attribute :recurring, "recurring"
      # For weekly windows, the weekday: 0 is Sunday, 6 is Saturday.
      # @return [Integer, nil]
      attribute :day_of_week, "dayOfWeek"
      # For weekly windows, the start time in minutes after midnight.
      # @return [Integer, nil]
      attribute :start_minute, "startMinute"
      # For weekly windows, the end time in minutes after midnight.
      # @return [Integer, nil]
      attribute :end_minute, "endMinute"
      # For weekly windows, repeat every this many weeks. Defaults to every week.
      # @return [Integer, nil]
      attribute :interval_weeks, "intervalWeeks"
      # First date a weekly window applies.
      # @return [String, nil]
      attribute :effective_from, "effectiveFrom"
      # Last date a weekly window applies; `null` for no end.
      # @return [String, nil]
      attribute :effective_to, "effectiveTo"
      # For one-off windows, when it starts.
      # @return [String, nil]
      attribute :start_date_time, "startDateTime"
      # For one-off windows, when it ends.
      # @return [String, nil]
      attribute :end_date_time, "endDateTime"
      # Whether these are the caregiver's preferred hours.
      # @return [Boolean, nil]
      attribute :is_preferred, "isPreferred"
      # Why the caregiver is unavailable, for time off.
      # @return [String, nil]
      attribute :reason, "reason"
      # Whether the window is in effect.
      # @return [Boolean, nil]
      attribute :is_active, "isActive"
    end

    # Fields to change on an availability window. Send only the fields to change; any other field
    # is refused with `unknown_field`. `caregiverId` is set when the availability window is
    # created and cannot be changed afterwards.
    class AvailabilityUpdate < Model
      # `true` when the caregiver can work in this window, `false` for time off.
      # @return [Boolean, nil]
      attribute :is_available, "isAvailable"
      # Whether the window repeats weekly.
      # @return [Boolean, nil]
      attribute :recurring, "recurring"
      # For weekly windows, the weekday: 0 is Sunday, 6 is Saturday.
      # @return [Integer, nil]
      attribute :day_of_week, "dayOfWeek"
      # For weekly windows, the start time in minutes after midnight.
      # @return [Integer, nil]
      attribute :start_minute, "startMinute"
      # For weekly windows, the end time in minutes after midnight.
      # @return [Integer, nil]
      attribute :end_minute, "endMinute"
      # For weekly windows, repeat every this many weeks. Defaults to every week.
      # @return [Integer, nil]
      attribute :interval_weeks, "intervalWeeks"
      # First date a weekly window applies.
      # @return [String, nil]
      attribute :effective_from, "effectiveFrom"
      # Last date a weekly window applies; `null` for no end.
      # @return [String, nil]
      attribute :effective_to, "effectiveTo"
      # For one-off windows, when it starts.
      # @return [String, nil]
      attribute :start_date_time, "startDateTime"
      # For one-off windows, when it ends.
      # @return [String, nil]
      attribute :end_date_time, "endDateTime"
      # Whether these are the caregiver's preferred hours.
      # @return [Boolean, nil]
      attribute :is_preferred, "isPreferred"
      # Why the caregiver is unavailable, for time off.
      # @return [String, nil]
      attribute :reason, "reason"
      # Whether the window is in effect.
      # @return [Boolean, nil]
      attribute :is_active, "isActive"
    end

    # Confirmation that an availability window was deleted.
    class AvailabilityDeleted < Model
      # Always `availability`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted availability window.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Skills and specialties on a caregiver's profile, such as dementia care or Hoyer lift
    # transfers. Every field is always present; a field with no value is `null`.
    class Specialization < Model
      # String representing the object's type. Always `specialization`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the specialization.
      # @return [String, nil]
      attribute :id, "id"
      # The caregiver.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # Name of the skill.
      # @return [String, nil]
      attribute :name, "name"
      # Details.
      # @return [String, nil]
      attribute :description, "description"
      # When the specialization was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the specialization was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new specialization. Any other field is refused with `unknown_field`.
    class SpecializationCreate < Model
      # The caregiver.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # Name of the skill.
      # @return [String, nil]
      attribute :name, "name"
      # Details.
      # @return [String, nil]
      attribute :description, "description"
    end

    # Fields to change on a specialization. Send only the fields to change; any other field is
    # refused with `unknown_field`. `caregiverId` is set when the specialization is created and
    # cannot be changed afterwards.
    class SpecializationUpdate < Model
      # Name of the skill.
      # @return [String, nil]
      attribute :name, "name"
      # Details.
      # @return [String, nil]
      attribute :description, "description"
    end

    # Confirmation that a specialization was deleted.
    class SpecializationDeleted < Model
      # Always `specialization`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted specialization.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # People who applied to work for your agency, tracked through your hiring stages until they
    # are hired as caregivers. Every field is always present; a field with no value is `null`.
    class Applicant < Model
      # String representing the object's type. Always `applicant`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the applicant.
      # @return [String, nil]
      attribute :id, "id"
      # Given name.
      # @return [String, nil]
      attribute :first_name, "firstName"
      # Middle name.
      # @return [String, nil]
      attribute :middle_name, "middleName"
      # Family name.
      # @return [String, nil]
      attribute :last_name, "lastName"
      # Email address.
      # @return [String, nil]
      attribute :email, "email"
      # Phone number.
      # @return [String, nil]
      attribute :phone, "phone"
      # Hiring stage, as named in your pipeline.
      # @return [String, nil]
      attribute :stage, "stage"
      # When the applicant last moved stage.
      # @return [String, nil]
      attribute :stage_changed_at, "stageChangedAt"
      # When the application was received.
      # @return [String, nil]
      attribute :application_date, "applicationDate"
      # Where the applicant found you.
      # @return [String, nil]
      attribute :application_source, "applicationSource"
      # Who referred the applicant.
      # @return [String, nil]
      attribute :referred_by, "referredBy"
      # City.
      # @return [String, nil]
      attribute :city, "city"
      # State, as a two-letter code.
      # @return [String, nil]
      attribute :state, "state"
      # ZIP code.
      # @return [String, nil]
      attribute :zip_code, "zipCode"
      # Earliest date the applicant can start.
      # @return [String, nil]
      attribute :desired_start_date, "desiredStartDate"
      # Hourly pay the applicant is asking for, in dollars.
      # @return [Float, nil]
      attribute :desired_pay_rate, "desiredPayRate"
      # Hours per week the applicant can work.
      # @return [Integer, nil]
      attribute :available_hours_per_week, "availableHoursPerWeek"
      # Years of caregiving experience.
      # @return [Integer, nil]
      attribute :years_experience, "yearsExperience"
      # Primary language.
      # @return [String, nil]
      attribute :primary_language, "primaryLanguage"
      # Whether the applicant has a driver's license.
      # @return [Boolean, nil]
      attribute :has_drivers_license, "hasDriversLicense"
      # Whether the applicant has reliable transportation.
      # @return [Boolean, nil]
      attribute :has_reliable_transportation, "hasReliableTransportation"
      # Whether the applicant holds a current CPR certification.
      # @return [Boolean, nil]
      attribute :has_cpr_certification, "hasCPRCertification"
      # Scheduled or completed interview time.
      # @return [String, nil]
      attribute :interview_date, "interviewDate"
      # Status of any job offer.
      # @return [String, nil]
      attribute :offer_status, "offerStatus"
      # The office the applicant applied to.
      # @return [String, nil]
      attribute :office_id, "officeId"
      # Recruiter notes.
      # @return [String, nil]
      attribute :notes, "notes"
      # The caregiver record created when the applicant was hired.
      # @return [String, nil]
      attribute :converted_to_caregiver_id, "convertedToCaregiverId"
      # When the applicant was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the applicant was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new applicant. Any other field is refused with `unknown_field`.
    class ApplicantCreate < Model
      # Given name.
      # @return [String, nil]
      attribute :first_name, "firstName"
      # Middle name.
      # @return [String, nil]
      attribute :middle_name, "middleName"
      # Family name.
      # @return [String, nil]
      attribute :last_name, "lastName"
      # Email address.
      # @return [String, nil]
      attribute :email, "email"
      # Phone number.
      # @return [String, nil]
      attribute :phone, "phone"
      # Hiring stage, as named in your pipeline.
      # @return [String, nil]
      attribute :stage, "stage"
      # When the application was received.
      # @return [String, nil]
      attribute :application_date, "applicationDate"
      # Where the applicant found you.
      # @return [String, nil]
      attribute :application_source, "applicationSource"
      # Who referred the applicant.
      # @return [String, nil]
      attribute :referred_by, "referredBy"
      # City.
      # @return [String, nil]
      attribute :city, "city"
      # State, as a two-letter code.
      # @return [String, nil]
      attribute :state, "state"
      # ZIP code.
      # @return [String, nil]
      attribute :zip_code, "zipCode"
      # Earliest date the applicant can start.
      # @return [String, nil]
      attribute :desired_start_date, "desiredStartDate"
      # Hourly pay the applicant is asking for, in dollars.
      # @return [Float, nil]
      attribute :desired_pay_rate, "desiredPayRate"
      # Hours per week the applicant can work.
      # @return [Integer, nil]
      attribute :available_hours_per_week, "availableHoursPerWeek"
      # Years of caregiving experience.
      # @return [Integer, nil]
      attribute :years_experience, "yearsExperience"
      # Primary language.
      # @return [String, nil]
      attribute :primary_language, "primaryLanguage"
      # Whether the applicant has a driver's license.
      # @return [Boolean, nil]
      attribute :has_drivers_license, "hasDriversLicense"
      # Whether the applicant has reliable transportation.
      # @return [Boolean, nil]
      attribute :has_reliable_transportation, "hasReliableTransportation"
      # Whether the applicant holds a current CPR certification.
      # @return [Boolean, nil]
      attribute :has_cpr_certification, "hasCPRCertification"
      # Scheduled or completed interview time.
      # @return [String, nil]
      attribute :interview_date, "interviewDate"
      # Status of any job offer.
      # @return [String, nil]
      attribute :offer_status, "offerStatus"
      # The office the applicant applied to.
      # @return [String, nil]
      attribute :office_id, "officeId"
      # Recruiter notes.
      # @return [String, nil]
      attribute :notes, "notes"
    end

    # Fields to change on an applicant. Send only the fields to change; any other field is refused
    # with `unknown_field`.
    class ApplicantUpdate < Model
      # Given name.
      # @return [String, nil]
      attribute :first_name, "firstName"
      # Middle name.
      # @return [String, nil]
      attribute :middle_name, "middleName"
      # Family name.
      # @return [String, nil]
      attribute :last_name, "lastName"
      # Email address.
      # @return [String, nil]
      attribute :email, "email"
      # Phone number.
      # @return [String, nil]
      attribute :phone, "phone"
      # Hiring stage, as named in your pipeline.
      # @return [String, nil]
      attribute :stage, "stage"
      # When the application was received.
      # @return [String, nil]
      attribute :application_date, "applicationDate"
      # Where the applicant found you.
      # @return [String, nil]
      attribute :application_source, "applicationSource"
      # Who referred the applicant.
      # @return [String, nil]
      attribute :referred_by, "referredBy"
      # City.
      # @return [String, nil]
      attribute :city, "city"
      # State, as a two-letter code.
      # @return [String, nil]
      attribute :state, "state"
      # ZIP code.
      # @return [String, nil]
      attribute :zip_code, "zipCode"
      # Earliest date the applicant can start.
      # @return [String, nil]
      attribute :desired_start_date, "desiredStartDate"
      # Hourly pay the applicant is asking for, in dollars.
      # @return [Float, nil]
      attribute :desired_pay_rate, "desiredPayRate"
      # Hours per week the applicant can work.
      # @return [Integer, nil]
      attribute :available_hours_per_week, "availableHoursPerWeek"
      # Years of caregiving experience.
      # @return [Integer, nil]
      attribute :years_experience, "yearsExperience"
      # Primary language.
      # @return [String, nil]
      attribute :primary_language, "primaryLanguage"
      # Whether the applicant has a driver's license.
      # @return [Boolean, nil]
      attribute :has_drivers_license, "hasDriversLicense"
      # Whether the applicant has reliable transportation.
      # @return [Boolean, nil]
      attribute :has_reliable_transportation, "hasReliableTransportation"
      # Whether the applicant holds a current CPR certification.
      # @return [Boolean, nil]
      attribute :has_cpr_certification, "hasCPRCertification"
      # Scheduled or completed interview time.
      # @return [String, nil]
      attribute :interview_date, "interviewDate"
      # Status of any job offer.
      # @return [String, nil]
      attribute :offer_status, "offerStatus"
      # The office the applicant applied to.
      # @return [String, nil]
      attribute :office_id, "officeId"
      # Recruiter notes.
      # @return [String, nil]
      attribute :notes, "notes"
    end

    # Confirmation that an applicant was deleted.
    class ApplicantDeleted < Model
      # Always `applicant`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted applicant.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Visits are scheduled or completed caregiver shifts at a patient's home. A visit's patient,
    # caregiver, times and status are set when it is created; reschedule or reassign a visit in
    # AveeCare. Every field is always present; a field with no value is `null`.
    class Visit < Model
      # String representing the object's type. Always `visit`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the visit.
      # @return [String, nil]
      attribute :id, "id"
      # The patient being visited.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # The caregiver assigned to the visit; `null` for an open shift.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # Scheduled start.
      # @return [String, nil]
      attribute :start_time, "startTime"
      # Scheduled end.
      # @return [String, nil]
      attribute :end_time, "endTime"
      # Where the visit is in its day. New visits are `Scheduled`.
      # @return [String, nil]
      attribute :status, "status"
      # Short title shown on the schedule.
      # @return [String, nil]
      attribute :title, "title"
      # Whether the visit spans the whole day, such as a live-in shift.
      # @return [Boolean, nil]
      attribute :is_all_day, "isAllDay"
      # Tasks the caregiver should complete during the visit.
      # @return [Array<String>, nil]
      attribute :tasks, "tasks"
      # Why the visit is scheduled, if it is not routine.
      # @return [String, nil]
      attribute :reason, "reason"
      # Notes for the caregiver about this visit.
      # @return [String, nil]
      attribute :notes, "notes"
      # Billing service code for the visit.
      # @return [String, nil]
      attribute :service_code, "serviceCode"
      # Where the visit takes place, when it is not the patient's home address.
      # @return [String, nil]
      attribute :location_address, "locationAddress"
      # When the caregiver clocked in.
      # @return [String, nil]
      attribute :actual_start_time, "actualStartTime"
      # When the caregiver clocked out.
      # @return [String, nil]
      attribute :actual_end_time, "actualEndTime"
      # Tasks the caregiver marked done.
      # @return [Array<String>, nil]
      attribute :completed_tasks, "completedTasks"
      # Whether the visit passed electronic visit verification.
      # @return [Boolean, nil]
      attribute :evv_verified, "evvVerified"
      # Electronic visit verification status.
      # @return [String, nil]
      attribute :evv_status, "evvStatus"
      # Whether the visit has been billed.
      # @return [String, nil]
      attribute :billing_status, "billingStatus"
      # The invoice the visit was billed on.
      # @return [String, nil]
      attribute :invoice_id, "invoiceId"
      # Hours billed for the visit.
      # @return [Float, nil]
      attribute :billable_hours, "billableHours"
      # Whether the visit belongs to a repeating series.
      # @return [Boolean, nil]
      attribute :is_recurring, "isRecurring"
      # The repeating series the visit belongs to.
      # @return [String, nil]
      attribute :recurrence_series_id, "recurrenceSeriesId"
      # The caregiver's response to the assignment.
      # @return [String, nil]
      attribute :caregiver_rsvp, "caregiverRSVP"
      # When the visit was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the visit was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new visit. Any other field is refused with `unknown_field`.
    class VisitCreate < Model
      # The patient being visited.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # The caregiver assigned to the visit; `null` for an open shift.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # Scheduled start.
      # @return [String, nil]
      attribute :start_time, "startTime"
      # Scheduled end.
      # @return [String, nil]
      attribute :end_time, "endTime"
      # Where the visit is in its day. New visits are `Scheduled`.
      # @return [String, nil]
      attribute :status, "status"
      # Short title shown on the schedule.
      # @return [String, nil]
      attribute :title, "title"
      # Whether the visit spans the whole day, such as a live-in shift.
      # @return [Boolean, nil]
      attribute :is_all_day, "isAllDay"
      # Tasks the caregiver should complete during the visit.
      # @return [Array<String>, nil]
      attribute :tasks, "tasks"
      # Why the visit is scheduled, if it is not routine.
      # @return [String, nil]
      attribute :reason, "reason"
      # Notes for the caregiver about this visit.
      # @return [String, nil]
      attribute :notes, "notes"
      # Billing service code for the visit.
      # @return [String, nil]
      attribute :service_code, "serviceCode"
      # Where the visit takes place, when it is not the patient's home address.
      # @return [String, nil]
      attribute :location_address, "locationAddress"
    end

    # Fields to change on a visit. Send only the fields to change; any other field is refused with
    # `unknown_field`. `patientId`, `caregiverId`, `startTime`, `endTime`, `status` are set when
    # the visit is created and cannot be changed afterwards.
    class VisitUpdate < Model
      # Short title shown on the schedule.
      # @return [String, nil]
      attribute :title, "title"
      # Whether the visit spans the whole day, such as a live-in shift.
      # @return [Boolean, nil]
      attribute :is_all_day, "isAllDay"
      # Tasks the caregiver should complete during the visit.
      # @return [Array<String>, nil]
      attribute :tasks, "tasks"
      # Why the visit is scheduled, if it is not routine.
      # @return [String, nil]
      attribute :reason, "reason"
      # Notes for the caregiver about this visit.
      # @return [String, nil]
      attribute :notes, "notes"
      # Billing service code for the visit.
      # @return [String, nil]
      attribute :service_code, "serviceCode"
      # Where the visit takes place, when it is not the patient's home address.
      # @return [String, nil]
      attribute :location_address, "locationAddress"
    end

    # Confirmation that a visit was deleted.
    class VisitDeleted < Model
      # Always `visit`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted visit.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Notes written about a visit by the caregiver or office staff. Every field is always present;
    # a field with no value is `null`.
    class VisitNote < Model
      # String representing the object's type. Always `visit_note`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the visit note.
      # @return [String, nil]
      attribute :id, "id"
      # The visit the note is about.
      # @return [String, nil]
      attribute :visit_id, "visitId"
      # The note.
      # @return [String, nil]
      attribute :content, "content"
      # Whether office staff (`User`) or a caregiver wrote the note. Set from the API key's user.
      # @return [String, nil]
      attribute :author_type, "authorType"
      # ID of the staff user or caregiver who wrote the note. Set from the API key's user.
      # @return [String, nil]
      attribute :author_id, "authorId"
      # When the visit note was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the visit note was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new visit note. Any other field is refused with `unknown_field`.
    class VisitNoteCreate < Model
      # The visit the note is about.
      # @return [String, nil]
      attribute :visit_id, "visitId"
      # The note.
      # @return [String, nil]
      attribute :content, "content"
    end

    # Fields to change on a visit note. Send only the fields to change; any other field is refused
    # with `unknown_field`. `visitId` is set when the visit note is created and cannot be changed
    # afterwards.
    class VisitNoteUpdate < Model
      # The note.
      # @return [String, nil]
      attribute :content, "content"
    end

    # Confirmation that a visit note was deleted.
    class VisitNoteDeleted < Model
      # Always `visit_note`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted visit note.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Requests from caregivers to pick up visits with a patient, which office staff approve or
    # deny. Every field is always present; a field with no value is `null`.
    class VisitRequest < Model
      # String representing the object's type. Always `visit_request`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the visit request.
      # @return [String, nil]
      attribute :id, "id"
      # The caregiver asking for the visit. With a caregiver's API key this is always that
      # caregiver (leave it out); office staff must send it.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # Caregiver's display name, taken from the caregiver's record.
      # @return [String, nil]
      attribute :caregiver_name, "caregiverName"
      # The patient the caregiver would visit.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # Patient's display name.
      # @return [String, nil]
      attribute :patient_name, "patientName"
      # First date the caregiver could start.
      # @return [String, nil]
      attribute :preferred_start_date, "preferredStartDate"
      # Last date of the request.
      # @return [String, nil]
      attribute :preferred_end_date, "preferredEndDate"
      # Time of day the caregiver prefers.
      # @return [String, nil]
      attribute :preferred_time_of_day, "preferredTimeOfDay"
      # Why the caregiver is asking.
      # @return [String, nil]
      attribute :reason, "reason"
      # Where the request stands. A caregiver's key creates `Pending` requests and can only change
      # its own pending request to `Cancelled`; approving and denying is for office staff.
      # @return [String, nil]
      attribute :status, "status"
      # The office's reply. Set by office staff.
      # @return [String, nil]
      attribute :admin_response, "adminResponse"
      # Who answered the request.
      # @return [String, nil]
      attribute :responded_by_name, "respondedByName"
      # When the request was answered.
      # @return [String, nil]
      attribute :responded_at, "respondedAt"
      # When the visit request was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the visit request was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new visit request. Any other field is refused with `unknown_field`.
    class VisitRequestCreate < Model
      # The caregiver asking for the visit. With a caregiver's API key this is always that
      # caregiver (leave it out); office staff must send it.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # The patient the caregiver would visit.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # Patient's display name.
      # @return [String, nil]
      attribute :patient_name, "patientName"
      # First date the caregiver could start.
      # @return [String, nil]
      attribute :preferred_start_date, "preferredStartDate"
      # Last date of the request.
      # @return [String, nil]
      attribute :preferred_end_date, "preferredEndDate"
      # Time of day the caregiver prefers.
      # @return [String, nil]
      attribute :preferred_time_of_day, "preferredTimeOfDay"
      # Why the caregiver is asking.
      # @return [String, nil]
      attribute :reason, "reason"
      # Where the request stands. A caregiver's key creates `Pending` requests and can only change
      # its own pending request to `Cancelled`; approving and denying is for office staff.
      # @return [String, nil]
      attribute :status, "status"
      # The office's reply. Set by office staff.
      # @return [String, nil]
      attribute :admin_response, "adminResponse"
    end

    # Fields to change on a visit request. Send only the fields to change; any other field is
    # refused with `unknown_field`. `caregiverId` is set when the visit request is created and
    # cannot be changed afterwards.
    class VisitRequestUpdate < Model
      # The patient the caregiver would visit.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # Patient's display name.
      # @return [String, nil]
      attribute :patient_name, "patientName"
      # First date the caregiver could start.
      # @return [String, nil]
      attribute :preferred_start_date, "preferredStartDate"
      # Last date of the request.
      # @return [String, nil]
      attribute :preferred_end_date, "preferredEndDate"
      # Time of day the caregiver prefers.
      # @return [String, nil]
      attribute :preferred_time_of_day, "preferredTimeOfDay"
      # Why the caregiver is asking.
      # @return [String, nil]
      attribute :reason, "reason"
      # Where the request stands. A caregiver's key creates `Pending` requests and can only change
      # its own pending request to `Cancelled`; approving and denying is for office staff.
      # @return [String, nil]
      attribute :status, "status"
      # The office's reply. Set by office staff.
      # @return [String, nil]
      attribute :admin_response, "adminResponse"
    end

    # Confirmation that a visit request was deleted.
    class VisitRequestDeleted < Model
      # Always `visit_request`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted visit request.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Open shifts are unassigned visits offered to caregivers so one of them can claim it. Every
    # field is always present; a field with no value is `null`.
    class OpenShift < Model
      # String representing the object's type. Always `open_shift`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the open shift.
      # @return [String, nil]
      attribute :id, "id"
      # The unassigned visit being offered.
      # @return [String, nil]
      attribute :visit_id, "visitId"
      # When the shift was offered.
      # @return [String, nil]
      attribute :broadcast_date, "broadcastDate"
      # Whether the offer is still open.
      # @return [String, nil]
      attribute :status, "status"
      # The caregiver who claimed the shift.
      # @return [String, nil]
      attribute :accepted_by, "acceptedBy"
      # When the open shift was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the open shift was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new open shift. Any other field is refused with `unknown_field`.
    class OpenShiftCreate < Model
      # The unassigned visit being offered.
      # @return [String, nil]
      attribute :visit_id, "visitId"
      # When the shift was offered.
      # @return [String, nil]
      attribute :broadcast_date, "broadcastDate"
      # Whether the offer is still open.
      # @return [String, nil]
      attribute :status, "status"
    end

    # Fields to change on an open shift. Send only the fields to change; any other field is
    # refused with `unknown_field`. `visitId` is set when the open shift is created and cannot be
    # changed afterwards.
    class OpenShiftUpdate < Model
      # When the shift was offered.
      # @return [String, nil]
      attribute :broadcast_date, "broadcastDate"
      # Whether the offer is still open.
      # @return [String, nil]
      attribute :status, "status"
    end

    # Confirmation that an open shift was deleted.
    class OpenShiftDeleted < Model
      # Always `open_shift`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted open shift.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Requests from one caregiver to hand a visit to another, which the other caregiver and then
    # the office approve. Every field is always present; a field with no value is `null`.
    class ShiftSwap < Model
      # String representing the object's type. Always `shift_swap`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the shift swap.
      # @return [String, nil]
      attribute :id, "id"
      # The visit to hand over.
      # @return [String, nil]
      attribute :visit_id, "visitId"
      # The caregiver giving up the visit. With a caregiver's API key this is always that
      # caregiver (leave it out), and the visit must be assigned to them; office staff must send
      # it.
      # @return [String, nil]
      attribute :requesting_caregiver_id, "requestingCaregiverId"
      # Display name of the requesting caregiver, taken from the caregiver's record.
      # @return [String, nil]
      attribute :requesting_caregiver_name, "requestingCaregiverName"
      # The caregiver asked to take the visit.
      # @return [String, nil]
      attribute :target_caregiver_id, "targetCaregiverId"
      # Display name of the target caregiver.
      # @return [String, nil]
      attribute :target_caregiver_name, "targetCaregiverName"
      # Why the swap is requested.
      # @return [String, nil]
      attribute :reason, "reason"
      # Where the swap stands. With a caregiver's key: new swaps are `Pending`; the asked
      # caregiver changes a `Pending` swap to `Accepted` or `Declined`; the requesting caregiver
      # can change it to `Cancelled`. `AdminApproved` and `AdminDenied` are for office staff.
      # @return [String, nil]
      attribute :status, "status"
      # When the swap was requested.
      # @return [String, nil]
      attribute :request_date, "requestDate"
      # When the target caregiver answered.
      # @return [String, nil]
      attribute :response_date, "responseDate"
      # When the office answered.
      # @return [String, nil]
      attribute :admin_response_date, "adminResponseDate"
      # When the shift swap was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the shift swap was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new shift swap. Any other field is refused with `unknown_field`.
    class ShiftSwapCreate < Model
      # The visit to hand over.
      # @return [String, nil]
      attribute :visit_id, "visitId"
      # The caregiver giving up the visit. With a caregiver's API key this is always that
      # caregiver (leave it out), and the visit must be assigned to them; office staff must send
      # it.
      # @return [String, nil]
      attribute :requesting_caregiver_id, "requestingCaregiverId"
      # The caregiver asked to take the visit.
      # @return [String, nil]
      attribute :target_caregiver_id, "targetCaregiverId"
      # Display name of the target caregiver.
      # @return [String, nil]
      attribute :target_caregiver_name, "targetCaregiverName"
      # Why the swap is requested.
      # @return [String, nil]
      attribute :reason, "reason"
      # Where the swap stands. With a caregiver's key: new swaps are `Pending`; the asked
      # caregiver changes a `Pending` swap to `Accepted` or `Declined`; the requesting caregiver
      # can change it to `Cancelled`. `AdminApproved` and `AdminDenied` are for office staff.
      # @return [String, nil]
      attribute :status, "status"
      # When the swap was requested.
      # @return [String, nil]
      attribute :request_date, "requestDate"
    end

    # Fields to change on a shift swap. Send only the fields to change; any other field is refused
    # with `unknown_field`. `visitId`, `requestingCaregiverId` are set when the shift swap is
    # created and cannot be changed afterwards.
    class ShiftSwapUpdate < Model
      # The caregiver asked to take the visit.
      # @return [String, nil]
      attribute :target_caregiver_id, "targetCaregiverId"
      # Display name of the target caregiver.
      # @return [String, nil]
      attribute :target_caregiver_name, "targetCaregiverName"
      # Why the swap is requested.
      # @return [String, nil]
      attribute :reason, "reason"
      # Where the swap stands. With a caregiver's key: new swaps are `Pending`; the asked
      # caregiver changes a `Pending` swap to `Accepted` or `Declined`; the requesting caregiver
      # can change it to `Cancelled`. `AdminApproved` and `AdminDenied` are for office staff.
      # @return [String, nil]
      attribute :status, "status"
      # When the swap was requested.
      # @return [String, nil]
      attribute :request_date, "requestDate"
    end

    # Confirmation that a shift swap was deleted.
    class ShiftSwapDeleted < Model
      # Always `shift_swap`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted shift swap.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Care plans describe the services a patient receives, how often, and when the plan is next
    # reviewed. The plan's goals and task lists are managed in AveeCare and are not included here.
    # Every field is always present; a field with no value is `null`.
    class CarePlan < Model
      # String representing the object's type. Always `care_plan`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the care plan.
      # @return [String, nil]
      attribute :id, "id"
      # The patient the plan is for.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # Plan title.
      # @return [String, nil]
      attribute :title, "title"
      # Where the plan is in its lifecycle.
      # @return [String, nil]
      attribute :status, "status"
      # Type of service the plan covers.
      # @return [String, nil]
      attribute :service_type, "serviceType"
      # How often visits happen under the plan.
      # @return [String, nil]
      attribute :frequency, "frequency"
      # Date the plan takes effect.
      # @return [String, nil]
      attribute :start_date, "startDate"
      # Date the plan ends; `null` if open-ended.
      # @return [String, nil]
      attribute :end_date, "endDate"
      # Date the plan is next due for review.
      # @return [String, nil]
      attribute :review_date, "reviewDate"
      # Days between reviews.
      # @return [Integer, nil]
      attribute :review_interval_days, "reviewIntervalDays"
      # When the plan was last reviewed.
      # @return [String, nil]
      attribute :last_reviewed_at, "lastReviewedAt"
      # Who last reviewed the plan.
      # @return [String, nil]
      attribute :last_reviewed_by_name, "lastReviewedByName"
      # Who created the plan.
      # @return [String, nil]
      attribute :created_by_name, "createdByName"
      # When the care plan was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the care plan was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new care plan. Any other field is refused with `unknown_field`.
    class CarePlanCreate < Model
      # The patient the plan is for.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # Plan title.
      # @return [String, nil]
      attribute :title, "title"
      # Where the plan is in its lifecycle.
      # @return [String, nil]
      attribute :status, "status"
      # Type of service the plan covers.
      # @return [String, nil]
      attribute :service_type, "serviceType"
      # How often visits happen under the plan.
      # @return [String, nil]
      attribute :frequency, "frequency"
      # Date the plan takes effect.
      # @return [String, nil]
      attribute :start_date, "startDate"
      # Date the plan ends; `null` if open-ended.
      # @return [String, nil]
      attribute :end_date, "endDate"
      # Date the plan is next due for review.
      # @return [String, nil]
      attribute :review_date, "reviewDate"
      # Days between reviews.
      # @return [Integer, nil]
      attribute :review_interval_days, "reviewIntervalDays"
    end

    # Fields to change on a care plan. Send only the fields to change; any other field is refused
    # with `unknown_field`. `patientId` is set when the care plan is created and cannot be changed
    # afterwards.
    class CarePlanUpdate < Model
      # Plan title.
      # @return [String, nil]
      attribute :title, "title"
      # Where the plan is in its lifecycle.
      # @return [String, nil]
      attribute :status, "status"
      # Type of service the plan covers.
      # @return [String, nil]
      attribute :service_type, "serviceType"
      # How often visits happen under the plan.
      # @return [String, nil]
      attribute :frequency, "frequency"
      # Date the plan takes effect.
      # @return [String, nil]
      attribute :start_date, "startDate"
      # Date the plan ends; `null` if open-ended.
      # @return [String, nil]
      attribute :end_date, "endDate"
      # Date the plan is next due for review.
      # @return [String, nil]
      attribute :review_date, "reviewDate"
      # Days between reviews.
      # @return [Integer, nil]
      attribute :review_interval_days, "reviewIntervalDays"
    end

    # Confirmation that a care plan was deleted.
    class CarePlanDeleted < Model
      # Always `care_plan`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted care plan.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Progress notes are the clinical summaries caregivers write after a visit. Every field is
    # always present; a field with no value is `null`.
    class ProgressNote < Model
      # String representing the object's type. Always `progress_note`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the progress note.
      # @return [String, nil]
      attribute :id, "id"
      # The visit the note documents.
      # @return [String, nil]
      attribute :visit_id, "visitId"
      # The patient.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # The caregiver who wrote the note. With a caregiver's API key this is always that caregiver
      # (leave it out), and the visit must be assigned to them.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # Display name of the caregiver, taken from the caregiver's record.
      # @return [String, nil]
      attribute :caregiver_name, "caregiverName"
      # The written summary of the visit.
      # @return [String, nil]
      attribute :summary, "summary"
      # Whether the summary was drafted with AI assistance.
      # @return [Boolean, nil]
      attribute :ai_generated, "aiGenerated"
      # When the progress note was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the progress note was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new progress note. Any other field is refused with `unknown_field`.
    class ProgressNoteCreate < Model
      # The visit the note documents.
      # @return [String, nil]
      attribute :visit_id, "visitId"
      # The patient.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # The caregiver who wrote the note. With a caregiver's API key this is always that caregiver
      # (leave it out), and the visit must be assigned to them.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # The written summary of the visit.
      # @return [String, nil]
      attribute :summary, "summary"
    end

    # Fields to change on a progress note. Send only the fields to change; any other field is
    # refused with `unknown_field`. `visitId`, `patientId`, `caregiverId` are set when the
    # progress note is created and cannot be changed afterwards.
    class ProgressNoteUpdate < Model
      # The written summary of the visit.
      # @return [String, nil]
      attribute :summary, "summary"
    end

    # Confirmation that a progress note was deleted.
    class ProgressNoteDeleted < Model
      # Always `progress_note`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted progress note.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Payer authorizations: how many units of a service a payer has approved for a patient, and
    # over what dates. Every field is always present; a field with no value is `null`.
    class Authorization < Model
      # String representing the object's type. Always `authorization`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the authorization.
      # @return [String, nil]
      attribute :id, "id"
      # The patient the authorization covers.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # The payer that issued it.
      # @return [String, nil]
      attribute :payer_name, "payerName"
      # The payer's authorization number.
      # @return [String, nil]
      attribute :authorization_number, "authorizationNumber"
      # Service authorized.
      # @return [String, nil]
      attribute :service_type, "serviceType"
      # Procedure (HCPCS) code billed against it.
      # @return [String, nil]
      attribute :procedure_code, "procedureCode"
      # Procedure code modifiers, comma separated.
      # @return [String, nil]
      attribute :modifiers, "modifiers"
      # First date the authorization covers.
      # @return [String, nil]
      attribute :start_date, "startDate"
      # Last date the authorization covers.
      # @return [String, nil]
      attribute :end_date, "endDate"
      # Units approved.
      # @return [Integer, nil]
      attribute :authorized_units, "authorizedUnits"
      # What a unit is, in the payer's words.
      # @return [String, nil]
      attribute :unit_type, "unitType"
      # Whether units count time, visits or days.
      # @return [String, nil]
      attribute :unit_basis, "unitBasis"
      # For time-based units, minutes in one unit.
      # @return [Integer, nil]
      attribute :minutes_per_unit, "minutesPerUnit"
      # Units used so far.
      # @return [Integer, nil]
      attribute :used_units, "usedUnits"
      # Units left.
      # @return [Integer, nil]
      attribute :remaining_units, "remainingUnits"
      # Frequency the payer approved.
      # @return [String, nil]
      attribute :frequency, "frequency"
      # Place-of-service code.
      # @return [String, nil]
      attribute :place_of_service, "placeOfService"
      # Whether the authorization is in effect.
      # @return [String, nil]
      attribute :status, "status"
      # Notes.
      # @return [String, nil]
      attribute :notes, "notes"
      # When the authorization was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the authorization was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new authorization. Any other field is refused with `unknown_field`.
    class AuthorizationCreate < Model
      # The patient the authorization covers.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # The payer that issued it.
      # @return [String, nil]
      attribute :payer_name, "payerName"
      # The payer's authorization number.
      # @return [String, nil]
      attribute :authorization_number, "authorizationNumber"
      # Service authorized.
      # @return [String, nil]
      attribute :service_type, "serviceType"
      # Procedure (HCPCS) code billed against it.
      # @return [String, nil]
      attribute :procedure_code, "procedureCode"
      # Procedure code modifiers, comma separated.
      # @return [String, nil]
      attribute :modifiers, "modifiers"
      # First date the authorization covers.
      # @return [String, nil]
      attribute :start_date, "startDate"
      # Last date the authorization covers.
      # @return [String, nil]
      attribute :end_date, "endDate"
      # Units approved.
      # @return [Integer, nil]
      attribute :authorized_units, "authorizedUnits"
      # What a unit is, in the payer's words.
      # @return [String, nil]
      attribute :unit_type, "unitType"
      # Whether units count time, visits or days.
      # @return [String, nil]
      attribute :unit_basis, "unitBasis"
      # For time-based units, minutes in one unit.
      # @return [Integer, nil]
      attribute :minutes_per_unit, "minutesPerUnit"
      # Frequency the payer approved.
      # @return [String, nil]
      attribute :frequency, "frequency"
      # Place-of-service code.
      # @return [String, nil]
      attribute :place_of_service, "placeOfService"
      # Whether the authorization is in effect.
      # @return [String, nil]
      attribute :status, "status"
      # Notes.
      # @return [String, nil]
      attribute :notes, "notes"
    end

    # Fields to change on an authorization. Send only the fields to change; any other field is
    # refused with `unknown_field`. `patientId` is set when the authorization is created and
    # cannot be changed afterwards.
    class AuthorizationUpdate < Model
      # The payer that issued it.
      # @return [String, nil]
      attribute :payer_name, "payerName"
      # The payer's authorization number.
      # @return [String, nil]
      attribute :authorization_number, "authorizationNumber"
      # Service authorized.
      # @return [String, nil]
      attribute :service_type, "serviceType"
      # Procedure (HCPCS) code billed against it.
      # @return [String, nil]
      attribute :procedure_code, "procedureCode"
      # Procedure code modifiers, comma separated.
      # @return [String, nil]
      attribute :modifiers, "modifiers"
      # First date the authorization covers.
      # @return [String, nil]
      attribute :start_date, "startDate"
      # Last date the authorization covers.
      # @return [String, nil]
      attribute :end_date, "endDate"
      # Units approved.
      # @return [Integer, nil]
      attribute :authorized_units, "authorizedUnits"
      # What a unit is, in the payer's words.
      # @return [String, nil]
      attribute :unit_type, "unitType"
      # Whether units count time, visits or days.
      # @return [String, nil]
      attribute :unit_basis, "unitBasis"
      # For time-based units, minutes in one unit.
      # @return [Integer, nil]
      attribute :minutes_per_unit, "minutesPerUnit"
      # Frequency the payer approved.
      # @return [String, nil]
      attribute :frequency, "frequency"
      # Place-of-service code.
      # @return [String, nil]
      attribute :place_of_service, "placeOfService"
      # Whether the authorization is in effect.
      # @return [String, nil]
      attribute :status, "status"
      # Notes.
      # @return [String, nil]
      attribute :notes, "notes"
    end

    # Confirmation that an authorization was deleted.
    class AuthorizationDeleted < Model
      # Always `authorization`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted authorization.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Incident reports: falls, injuries, medication errors and other events that need follow-up,
    # often for regulatory reporting. Every field is always present; a field with no value is
    # `null`.
    class Incident < Model
      # String representing the object's type. Always `incident`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the incident.
      # @return [String, nil]
      attribute :id, "id"
      # Short summary.
      # @return [String, nil]
      attribute :title, "title"
      # What happened.
      # @return [String, nil]
      attribute :description, "description"
      # When the incident happened.
      # @return [String, nil]
      attribute :incident_date_time, "incidentDateTime"
      # Kind of incident.
      # @return [String, nil]
      attribute :category, "category"
      # How serious it was.
      # @return [String, nil]
      attribute :severity, "severity"
      # Where follow-up stands. New incidents start `Open`.
      # @return [String, nil]
      attribute :status, "status"
      # The patient involved.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # The caregiver involved.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # The visit during which it happened.
      # @return [String, nil]
      attribute :visit_id, "visitId"
      # What was done at the time.
      # @return [String, nil]
      attribute :actions_taken, "actionsTaken"
      # Body part injured, if any.
      # @return [String, nil]
      attribute :injury_body_part, "injuryBodyPart"
      # Witness, if any.
      # @return [String, nil]
      attribute :witness_name, "witnessName"
      # Whether 911 or other emergency services were called.
      # @return [Boolean, nil]
      attribute :emergency_services_contacted, "emergencyServicesContacted"
      # Whether the patient went to hospital.
      # @return [Boolean, nil]
      attribute :hospital_transport, "hospitalTransport"
      # Hospital, if transported.
      # @return [String, nil]
      attribute :hospital_name, "hospitalName"
      # Whether the patient's physician was told.
      # @return [Boolean, nil]
      attribute :physician_notified, "physicianNotified"
      # Whether family was told.
      # @return [Boolean, nil]
      attribute :family_notified, "familyNotified"
      # Whether the incident must be reported to a regulator.
      # @return [Boolean, nil]
      attribute :regulatory_report_required, "regulatoryReportRequired"
      # Whether follow-up is needed.
      # @return [Boolean, nil]
      attribute :follow_up_required, "followUpRequired"
      # When follow-up is due.
      # @return [String, nil]
      attribute :follow_up_due_at, "followUpDueAt"
      # Follow-up notes.
      # @return [String, nil]
      attribute :follow_up_notes, "followUpNotes"
      # Whether the incident is resolved.
      # @return [Boolean, nil]
      attribute :resolved, "resolved"
      # How it was resolved.
      # @return [String, nil]
      attribute :resolution_notes, "resolutionNotes"
      # Whether only administrators can see it.
      # @return [Boolean, nil]
      attribute :is_confidential, "isConfidential"
      # Who reported it.
      # @return [String, nil]
      attribute :reported_by_name, "reportedByName"
      # When it was reported.
      # @return [String, nil]
      attribute :reported_at, "reportedAt"
      # When it was resolved.
      # @return [String, nil]
      attribute :resolved_at, "resolvedAt"
      # When the incident was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the incident was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new incident. Any other field is refused with `unknown_field`.
    class IncidentCreate < Model
      # Short summary.
      # @return [String, nil]
      attribute :title, "title"
      # What happened.
      # @return [String, nil]
      attribute :description, "description"
      # When the incident happened.
      # @return [String, nil]
      attribute :incident_date_time, "incidentDateTime"
      # Kind of incident.
      # @return [String, nil]
      attribute :category, "category"
      # How serious it was.
      # @return [String, nil]
      attribute :severity, "severity"
      # Where follow-up stands. New incidents start `Open`. Only keys belonging to office staff
      # can set this.
      # @return [String, nil]
      attribute :status, "status"
      # The patient involved.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # The caregiver involved.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # The visit during which it happened.
      # @return [String, nil]
      attribute :visit_id, "visitId"
      # What was done at the time.
      # @return [String, nil]
      attribute :actions_taken, "actionsTaken"
      # Body part injured, if any.
      # @return [String, nil]
      attribute :injury_body_part, "injuryBodyPart"
      # Witness, if any.
      # @return [String, nil]
      attribute :witness_name, "witnessName"
      # Whether 911 or other emergency services were called.
      # @return [Boolean, nil]
      attribute :emergency_services_contacted, "emergencyServicesContacted"
      # Whether the patient went to hospital.
      # @return [Boolean, nil]
      attribute :hospital_transport, "hospitalTransport"
      # Hospital, if transported.
      # @return [String, nil]
      attribute :hospital_name, "hospitalName"
      # Whether the patient's physician was told.
      # @return [Boolean, nil]
      attribute :physician_notified, "physicianNotified"
      # Whether family was told.
      # @return [Boolean, nil]
      attribute :family_notified, "familyNotified"
      # Whether the incident must be reported to a regulator.
      # @return [Boolean, nil]
      attribute :regulatory_report_required, "regulatoryReportRequired"
      # Whether follow-up is needed.
      # @return [Boolean, nil]
      attribute :follow_up_required, "followUpRequired"
      # When follow-up is due. Only keys belonging to office staff can set this.
      # @return [String, nil]
      attribute :follow_up_due_at, "followUpDueAt"
      # Follow-up notes.
      # @return [String, nil]
      attribute :follow_up_notes, "followUpNotes"
      # Whether the incident is resolved. Only keys belonging to office staff can set this.
      # @return [Boolean, nil]
      attribute :resolved, "resolved"
      # How it was resolved. Only keys belonging to office staff can set this.
      # @return [String, nil]
      attribute :resolution_notes, "resolutionNotes"
      # Whether only administrators can see it. Only keys belonging to office staff can set this.
      # @return [Boolean, nil]
      attribute :is_confidential, "isConfidential"
    end

    # Fields to change on an incident. Send only the fields to change; any other field is refused
    # with `unknown_field`.
    class IncidentUpdate < Model
      # Short summary.
      # @return [String, nil]
      attribute :title, "title"
      # What happened.
      # @return [String, nil]
      attribute :description, "description"
      # When the incident happened.
      # @return [String, nil]
      attribute :incident_date_time, "incidentDateTime"
      # Kind of incident.
      # @return [String, nil]
      attribute :category, "category"
      # How serious it was.
      # @return [String, nil]
      attribute :severity, "severity"
      # Where follow-up stands. New incidents start `Open`. Only keys belonging to office staff
      # can set this.
      # @return [String, nil]
      attribute :status, "status"
      # The patient involved.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # The caregiver involved.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # The visit during which it happened.
      # @return [String, nil]
      attribute :visit_id, "visitId"
      # What was done at the time.
      # @return [String, nil]
      attribute :actions_taken, "actionsTaken"
      # Body part injured, if any.
      # @return [String, nil]
      attribute :injury_body_part, "injuryBodyPart"
      # Witness, if any.
      # @return [String, nil]
      attribute :witness_name, "witnessName"
      # Whether 911 or other emergency services were called.
      # @return [Boolean, nil]
      attribute :emergency_services_contacted, "emergencyServicesContacted"
      # Whether the patient went to hospital.
      # @return [Boolean, nil]
      attribute :hospital_transport, "hospitalTransport"
      # Hospital, if transported.
      # @return [String, nil]
      attribute :hospital_name, "hospitalName"
      # Whether the patient's physician was told.
      # @return [Boolean, nil]
      attribute :physician_notified, "physicianNotified"
      # Whether family was told.
      # @return [Boolean, nil]
      attribute :family_notified, "familyNotified"
      # Whether the incident must be reported to a regulator.
      # @return [Boolean, nil]
      attribute :regulatory_report_required, "regulatoryReportRequired"
      # Whether follow-up is needed.
      # @return [Boolean, nil]
      attribute :follow_up_required, "followUpRequired"
      # When follow-up is due. Only keys belonging to office staff can set this.
      # @return [String, nil]
      attribute :follow_up_due_at, "followUpDueAt"
      # Follow-up notes.
      # @return [String, nil]
      attribute :follow_up_notes, "followUpNotes"
      # Whether the incident is resolved. Only keys belonging to office staff can set this.
      # @return [Boolean, nil]
      attribute :resolved, "resolved"
      # How it was resolved. Only keys belonging to office staff can set this.
      # @return [String, nil]
      attribute :resolution_notes, "resolutionNotes"
      # Whether only administrators can see it. Only keys belonging to office staff can set this.
      # @return [Boolean, nil]
      attribute :is_confidential, "isConfidential"
    end

    # Confirmation that an incident was deleted.
    class IncidentDeleted < Model
      # Always `incident`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted incident.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Events your agency documents about a patient, caregiver or visit, such as a complaint, a
    # compliment or an attendance issue. Every field is always present; a field with no value is
    # `null`.
    class Event < Model
      # String representing the object's type. Always `event`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the event.
      # @return [String, nil]
      attribute :id, "id"
      # Short summary.
      # @return [String, nil]
      attribute :title, "title"
      # What happened.
      # @return [String, nil]
      attribute :description, "description"
      # Category, as named in your agency's event types.
      # @return [String, nil]
      attribute :category, "category"
      # How serious it was.
      # @return [String, nil]
      attribute :severity, "severity"
      # Where follow-up stands.
      # @return [String, nil]
      attribute :status, "status"
      # When it happened.
      # @return [String, nil]
      attribute :occurred_at, "occurredAt"
      # The patient involved.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # The caregiver involved.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # The visit involved.
      # @return [String, nil]
      attribute :visit_id, "visitId"
      # Attendance points this event counts for, if your agency uses a points policy.
      # @return [Float, nil]
      attribute :point_value, "pointValue"
      # What was done.
      # @return [String, nil]
      attribute :actions_taken, "actionsTaken"
      # Outcome.
      # @return [String, nil]
      attribute :outcome, "outcome"
      # Whether follow-up is needed.
      # @return [Boolean, nil]
      attribute :follow_up_required, "followUpRequired"
      # When follow-up is due.
      # @return [String, nil]
      attribute :follow_up_due_at, "followUpDueAt"
      # Follow-up notes.
      # @return [String, nil]
      attribute :follow_up_notes, "followUpNotes"
      # How it was resolved.
      # @return [String, nil]
      attribute :resolution_notes, "resolutionNotes"
      # Whether only administrators can see it.
      # @return [Boolean, nil]
      attribute :is_confidential, "isConfidential"
      # Who documented it.
      # @return [String, nil]
      attribute :reported_by_name, "reportedByName"
      # When it was documented.
      # @return [String, nil]
      attribute :reported_at, "reportedAt"
      # When it was resolved.
      # @return [String, nil]
      attribute :resolved_at, "resolvedAt"
      # When the event was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the event was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new event. Any other field is refused with `unknown_field`.
    class EventCreate < Model
      # Short summary.
      # @return [String, nil]
      attribute :title, "title"
      # What happened.
      # @return [String, nil]
      attribute :description, "description"
      # Category, as named in your agency's event types.
      # @return [String, nil]
      attribute :category, "category"
      # How serious it was.
      # @return [String, nil]
      attribute :severity, "severity"
      # Where follow-up stands.
      # @return [String, nil]
      attribute :status, "status"
      # When it happened.
      # @return [String, nil]
      attribute :occurred_at, "occurredAt"
      # The patient involved.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # The caregiver involved.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # The visit involved.
      # @return [String, nil]
      attribute :visit_id, "visitId"
      # Attendance points this event counts for, if your agency uses a points policy.
      # @return [Float, nil]
      attribute :point_value, "pointValue"
      # What was done.
      # @return [String, nil]
      attribute :actions_taken, "actionsTaken"
      # Outcome.
      # @return [String, nil]
      attribute :outcome, "outcome"
      # Whether follow-up is needed.
      # @return [Boolean, nil]
      attribute :follow_up_required, "followUpRequired"
      # When follow-up is due.
      # @return [String, nil]
      attribute :follow_up_due_at, "followUpDueAt"
      # Follow-up notes.
      # @return [String, nil]
      attribute :follow_up_notes, "followUpNotes"
      # How it was resolved.
      # @return [String, nil]
      attribute :resolution_notes, "resolutionNotes"
      # Whether only administrators can see it.
      # @return [Boolean, nil]
      attribute :is_confidential, "isConfidential"
    end

    # Fields to change on an event. Send only the fields to change; any other field is refused
    # with `unknown_field`.
    class EventUpdate < Model
      # Short summary.
      # @return [String, nil]
      attribute :title, "title"
      # What happened.
      # @return [String, nil]
      attribute :description, "description"
      # Category, as named in your agency's event types.
      # @return [String, nil]
      attribute :category, "category"
      # How serious it was.
      # @return [String, nil]
      attribute :severity, "severity"
      # Where follow-up stands.
      # @return [String, nil]
      attribute :status, "status"
      # When it happened.
      # @return [String, nil]
      attribute :occurred_at, "occurredAt"
      # The patient involved.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # The caregiver involved.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # The visit involved.
      # @return [String, nil]
      attribute :visit_id, "visitId"
      # Attendance points this event counts for, if your agency uses a points policy.
      # @return [Float, nil]
      attribute :point_value, "pointValue"
      # What was done.
      # @return [String, nil]
      attribute :actions_taken, "actionsTaken"
      # Outcome.
      # @return [String, nil]
      attribute :outcome, "outcome"
      # Whether follow-up is needed.
      # @return [Boolean, nil]
      attribute :follow_up_required, "followUpRequired"
      # When follow-up is due.
      # @return [String, nil]
      attribute :follow_up_due_at, "followUpDueAt"
      # Follow-up notes.
      # @return [String, nil]
      attribute :follow_up_notes, "followUpNotes"
      # How it was resolved.
      # @return [String, nil]
      attribute :resolution_notes, "resolutionNotes"
      # Whether only administrators can see it.
      # @return [Boolean, nil]
      attribute :is_confidential, "isConfidential"
    end

    # Confirmation that an event was deleted.
    class EventDeleted < Model
      # Always `event`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted event.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Hospitals, physicians, case managers and other organizations that refer clients to your
    # agency. Every field is always present; a field with no value is `null`.
    class ReferralSource < Model
      # String representing the object's type. Always `referral_source`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the referral source.
      # @return [String, nil]
      attribute :id, "id"
      # Name of the source.
      # @return [String, nil]
      attribute :name, "name"
      # Kind of source, such as Hospital or Physician.
      # @return [String, nil]
      attribute :type, "type"
      # Organization the contact works for.
      # @return [String, nil]
      attribute :organization, "organization"
      # Main contact.
      # @return [String, nil]
      attribute :contact_name, "contactName"
      # Contact's job title.
      # @return [String, nil]
      attribute :contact_title, "contactTitle"
      # Contact's phone number.
      # @return [String, nil]
      attribute :contact_phone, "contactPhone"
      # Contact's email address.
      # @return [String, nil]
      attribute :contact_email, "contactEmail"
      # Street address.
      # @return [String, nil]
      attribute :address, "address"
      # City.
      # @return [String, nil]
      attribute :city, "city"
      # State, as a two-letter code.
      # @return [String, nil]
      attribute :state, "state"
      # ZIP code.
      # @return [String, nil]
      attribute :zip_code, "zipCode"
      # Notes.
      # @return [String, nil]
      attribute :notes, "notes"
      # Whether you still receive referrals from this source.
      # @return [Boolean, nil]
      attribute :is_active, "isActive"
      # Referrals received from this source.
      # @return [Integer, nil]
      attribute :total_referrals, "totalReferrals"
      # Referrals from this source that became clients.
      # @return [Integer, nil]
      attribute :total_conversions, "totalConversions"
      # When the most recent referral arrived.
      # @return [String, nil]
      attribute :last_referral_date, "lastReferralDate"
      # When the referral source was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the referral source was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new referral source. Any other field is refused with `unknown_field`.
    class ReferralSourceCreate < Model
      # Name of the source.
      # @return [String, nil]
      attribute :name, "name"
      # Kind of source, such as Hospital or Physician.
      # @return [String, nil]
      attribute :type, "type"
      # Organization the contact works for.
      # @return [String, nil]
      attribute :organization, "organization"
      # Main contact.
      # @return [String, nil]
      attribute :contact_name, "contactName"
      # Contact's job title.
      # @return [String, nil]
      attribute :contact_title, "contactTitle"
      # Contact's phone number.
      # @return [String, nil]
      attribute :contact_phone, "contactPhone"
      # Contact's email address.
      # @return [String, nil]
      attribute :contact_email, "contactEmail"
      # Street address.
      # @return [String, nil]
      attribute :address, "address"
      # City.
      # @return [String, nil]
      attribute :city, "city"
      # State, as a two-letter code.
      # @return [String, nil]
      attribute :state, "state"
      # ZIP code.
      # @return [String, nil]
      attribute :zip_code, "zipCode"
      # Notes.
      # @return [String, nil]
      attribute :notes, "notes"
      # Whether you still receive referrals from this source.
      # @return [Boolean, nil]
      attribute :is_active, "isActive"
    end

    # Fields to change on a referral source. Send only the fields to change; any other field is
    # refused with `unknown_field`.
    class ReferralSourceUpdate < Model
      # Name of the source.
      # @return [String, nil]
      attribute :name, "name"
      # Kind of source, such as Hospital or Physician.
      # @return [String, nil]
      attribute :type, "type"
      # Organization the contact works for.
      # @return [String, nil]
      attribute :organization, "organization"
      # Main contact.
      # @return [String, nil]
      attribute :contact_name, "contactName"
      # Contact's job title.
      # @return [String, nil]
      attribute :contact_title, "contactTitle"
      # Contact's phone number.
      # @return [String, nil]
      attribute :contact_phone, "contactPhone"
      # Contact's email address.
      # @return [String, nil]
      attribute :contact_email, "contactEmail"
      # Street address.
      # @return [String, nil]
      attribute :address, "address"
      # City.
      # @return [String, nil]
      attribute :city, "city"
      # State, as a two-letter code.
      # @return [String, nil]
      attribute :state, "state"
      # ZIP code.
      # @return [String, nil]
      attribute :zip_code, "zipCode"
      # Notes.
      # @return [String, nil]
      attribute :notes, "notes"
      # Whether you still receive referrals from this source.
      # @return [Boolean, nil]
      attribute :is_active, "isActive"
    end

    # Confirmation that a referral source was deleted.
    class ReferralSourceDeleted < Model
      # Always `referral_source`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted referral source.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Individual referrals of a prospective client, tracked from first contact to admission. Every
    # field is always present; a field with no value is `null`.
    class Referral < Model
      # String representing the object's type. Always `referral`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the referral.
      # @return [String, nil]
      attribute :id, "id"
      # Who made the referral.
      # @return [String, nil]
      attribute :referral_source_id, "referralSourceId"
      # The patient record, once one exists.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # Name of the person referred.
      # @return [String, nil]
      attribute :patient_name, "patientName"
      # Phone number to reach the person or their family.
      # @return [String, nil]
      attribute :contact_phone, "contactPhone"
      # Email address to reach the person or their family.
      # @return [String, nil]
      attribute :contact_email, "contactEmail"
      # When the referral arrived.
      # @return [String, nil]
      attribute :referral_date, "referralDate"
      # Where the referral stands.
      # @return [String, nil]
      attribute :status, "status"
      # Care the person is expected to need.
      # @return [String, nil]
      attribute :estimated_care_needs, "estimatedCareNeeds"
      # Expected hours of care per week.
      # @return [Float, nil]
      attribute :estimated_weekly_hours, "estimatedWeeklyHours"
      # How soon care is needed.
      # @return [String, nil]
      attribute :urgency_level, "urgencyLevel"
      # Why the referral was declined or lost.
      # @return [String, nil]
      attribute :decline_reason, "declineReason"
      # Notes.
      # @return [String, nil]
      attribute :notes, "notes"
      # When the person was admitted as a client.
      # @return [String, nil]
      attribute :converted_date, "convertedDate"
      # When the referral was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the referral was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new referral. Any other field is refused with `unknown_field`.
    class ReferralCreate < Model
      # Who made the referral.
      # @return [String, nil]
      attribute :referral_source_id, "referralSourceId"
      # The patient record, once one exists.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # Name of the person referred.
      # @return [String, nil]
      attribute :patient_name, "patientName"
      # Phone number to reach the person or their family.
      # @return [String, nil]
      attribute :contact_phone, "contactPhone"
      # Email address to reach the person or their family.
      # @return [String, nil]
      attribute :contact_email, "contactEmail"
      # When the referral arrived.
      # @return [String, nil]
      attribute :referral_date, "referralDate"
      # Where the referral stands.
      # @return [String, nil]
      attribute :status, "status"
      # Care the person is expected to need.
      # @return [String, nil]
      attribute :estimated_care_needs, "estimatedCareNeeds"
      # Expected hours of care per week.
      # @return [Float, nil]
      attribute :estimated_weekly_hours, "estimatedWeeklyHours"
      # How soon care is needed.
      # @return [String, nil]
      attribute :urgency_level, "urgencyLevel"
      # Why the referral was declined or lost.
      # @return [String, nil]
      attribute :decline_reason, "declineReason"
      # Notes.
      # @return [String, nil]
      attribute :notes, "notes"
    end

    # Fields to change on a referral. Send only the fields to change; any other field is refused
    # with `unknown_field`.
    class ReferralUpdate < Model
      # Who made the referral.
      # @return [String, nil]
      attribute :referral_source_id, "referralSourceId"
      # The patient record, once one exists.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # Name of the person referred.
      # @return [String, nil]
      attribute :patient_name, "patientName"
      # Phone number to reach the person or their family.
      # @return [String, nil]
      attribute :contact_phone, "contactPhone"
      # Email address to reach the person or their family.
      # @return [String, nil]
      attribute :contact_email, "contactEmail"
      # When the referral arrived.
      # @return [String, nil]
      attribute :referral_date, "referralDate"
      # Where the referral stands.
      # @return [String, nil]
      attribute :status, "status"
      # Care the person is expected to need.
      # @return [String, nil]
      attribute :estimated_care_needs, "estimatedCareNeeds"
      # Expected hours of care per week.
      # @return [Float, nil]
      attribute :estimated_weekly_hours, "estimatedWeeklyHours"
      # How soon care is needed.
      # @return [String, nil]
      attribute :urgency_level, "urgencyLevel"
      # Why the referral was declined or lost.
      # @return [String, nil]
      attribute :decline_reason, "declineReason"
      # Notes.
      # @return [String, nil]
      attribute :notes, "notes"
    end

    # Confirmation that a referral was deleted.
    class ReferralDeleted < Model
      # Always `referral`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted referral.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Invoices billed to patients and their families for private-pay care. Read-only. Every field
    # is always present; a field with no value is `null`.
    class Invoice < Model
      # String representing the object's type. Always `invoice`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the invoice.
      # @return [String, nil]
      attribute :id, "id"
      # Invoice number shown to the patient.
      # @return [String, nil]
      attribute :invoice_number, "invoiceNumber"
      # The patient billed.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # Payment status.
      # @return [String, nil]
      attribute :status, "status"
      # Date of the invoice.
      # @return [String, nil]
      attribute :invoice_date, "invoiceDate"
      # Date payment is due.
      # @return [String, nil]
      attribute :due_date, "dueDate"
      # First day of service billed.
      # @return [String, nil]
      attribute :period_start, "periodStart"
      # Last day of service billed.
      # @return [String, nil]
      attribute :period_end, "periodEnd"
      # Description shown on the invoice.
      # @return [String, nil]
      attribute :description, "description"
      # Three-letter currency code.
      # @return [String, nil]
      attribute :currency, "currency"
      # Total before tax, discounts and credits. In cents.
      # @return [Integer, nil]
      attribute :subtotal_cents, "subtotalCents"
      # Tax. In cents.
      # @return [Integer, nil]
      attribute :tax_cents, "taxCents"
      # Discounts applied. In cents.
      # @return [Integer, nil]
      attribute :discount_cents, "discountCents"
      # Account credit applied. In cents.
      # @return [Integer, nil]
      attribute :credit_applied_cents, "creditAppliedCents"
      # Invoice total. In cents.
      # @return [Integer, nil]
      attribute :total_cents, "totalCents"
      # Amount paid so far. In cents.
      # @return [Integer, nil]
      attribute :amount_paid_cents, "amountPaidCents"
      # Amount still owed. In cents.
      # @return [Integer, nil]
      attribute :amount_due_cents, "amountDueCents"
      # Visits billed on this invoice.
      # @return [Array<String>, nil]
      attribute :visit_ids, "visitIds"
      # Whether AveeCare created the invoice automatically when a visit was completed.
      # @return [Boolean, nil]
      attribute :is_auto_billed, "isAutoBilled"
      # When the invoice was sent.
      # @return [String, nil]
      attribute :sent_at, "sentAt"
      # When the invoice was paid in full.
      # @return [String, nil]
      attribute :paid_date, "paidDate"
      # When the invoice was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the invoice was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # The individual charges on an invoice. Read-only. Every field is always present; a field with
    # no value is `null`.
    class InvoiceLineItem < Model
      # String representing the object's type. Always `invoice_line_item`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the invoice line item.
      # @return [String, nil]
      attribute :id, "id"
      # The invoice this line belongs to.
      # @return [String, nil]
      attribute :invoice_id, "invoiceId"
      # Line description.
      # @return [String, nil]
      attribute :description, "description"
      # Quantity, such as hours.
      # @return [Float, nil]
      attribute :quantity, "quantity"
      # Price per unit. In cents.
      # @return [Integer, nil]
      attribute :unit_price_cents, "unitPriceCents"
      # Line total. In cents.
      # @return [Integer, nil]
      attribute :total_cents, "totalCents"
      # Service code.
      # @return [String, nil]
      attribute :service_code, "serviceCode"
      # Service category.
      # @return [String, nil]
      attribute :service_category, "serviceCategory"
      # The visit this line bills.
      # @return [String, nil]
      attribute :visit_id, "visitId"
      # Date of the visit.
      # @return [String, nil]
      attribute :visit_date, "visitDate"
      # Position of the line on the invoice.
      # @return [Integer, nil]
      attribute :sort_order, "sortOrder"
      # When the invoice line item was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the invoice line item was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Insurance claims billed to Medicaid, Medicare and other payers, with their adjudication
    # status. Read-only. Every field is always present; a field with no value is `null`.
    class Claim < Model
      # String representing the object's type. Always `claim`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the claim.
      # @return [String, nil]
      attribute :id, "id"
      # The patient the claim is for.
      # @return [String, nil]
      attribute :patient_id, "patientId"
      # The caregiver who provided the service.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # The visit billed, for single-visit claims.
      # @return [String, nil]
      attribute :visit_id, "visitId"
      # The related invoice, if any.
      # @return [String, nil]
      attribute :invoice_id, "invoiceId"
      # Your claim number.
      # @return [String, nil]
      attribute :claim_number, "claimNumber"
      # Claim format: professional (837P) or institutional (837I).
      # @return [String, nil]
      attribute :claim_type, "claimType"
      # The payer billed.
      # @return [String, nil]
      attribute :payer_name, "payerName"
      # The payer's electronic payer ID.
      # @return [String, nil]
      attribute :payer_id, "payerId"
      # First date of service, as `YYYY-MM-DD`.
      # @return [String, nil]
      attribute :service_date_start, "serviceDateStart"
      # Last date of service, as `YYYY-MM-DD`.
      # @return [String, nil]
      attribute :service_date_end, "serviceDateEnd"
      # Total billed. In cents.
      # @return [Integer, nil]
      attribute :total_charge_amount_cents, "totalChargeAmountCents"
      # Where the claim is in adjudication.
      # @return [String, nil]
      attribute :status, "status"
      # Latest status detail from the payer or clearinghouse.
      # @return [String, nil]
      attribute :status_message, "statusMessage"
      # When the status last changed, ISO 8601.
      # @return [String, nil]
      attribute :status_updated_at, "statusUpdatedAt"
      # Amount the payer paid. In cents.
      # @return [Integer, nil]
      attribute :paid_amount_cents, "paidAmountCents"
      # Amount the patient owes after the payer. In cents.
      # @return [Integer, nil]
      attribute :patient_responsibility_cents, "patientResponsibilityCents"
      # Authorization number sent on the claim.
      # @return [String, nil]
      attribute :prior_auth_number, "priorAuthNumber"
      # Payment check or EFT trace number.
      # @return [String, nil]
      attribute :check_number, "checkNumber"
      # When the claim was submitted, ISO 8601.
      # @return [String, nil]
      attribute :submitted_at, "submittedAt"
      # When the claim was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the claim was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # One caregiver's hours and pay for one pay period. Read-only. Every field is always present;
    # a field with no value is `null`.
    class PayrollEntry < Model
      # String representing the object's type. Always `payroll_entry`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the payroll entry.
      # @return [String, nil]
      attribute :id, "id"
      # The caregiver paid.
      # @return [String, nil]
      attribute :caregiver_id, "caregiverId"
      # First day of the pay period.
      # @return [String, nil]
      attribute :pay_period_start, "payPeriodStart"
      # Last day of the pay period.
      # @return [String, nil]
      attribute :pay_period_end, "payPeriodEnd"
      # Where the entry is in your payroll process.
      # @return [String, nil]
      attribute :status, "status"
      # Regular hours.
      # @return [Float, nil]
      attribute :regular_hours, "regularHours"
      # Overtime hours.
      # @return [Float, nil]
      attribute :overtime_hours, "overtimeHours"
      # Holiday hours.
      # @return [Float, nil]
      attribute :holiday_hours, "holidayHours"
      # Paid time off hours.
      # @return [Float, nil]
      attribute :pto_hours, "ptoHours"
      # Sick leave hours.
      # @return [Float, nil]
      attribute :sick_leave_hours, "sickLeaveHours"
      # Gross pay. In cents.
      # @return [Integer, nil]
      attribute :gross_pay_cents, "grossPayCents"
      # Total deductions. In cents.
      # @return [Integer, nil]
      attribute :deductions_cents, "deductionsCents"
      # Net pay. In cents.
      # @return [Integer, nil]
      attribute :net_pay_cents, "netPayCents"
      # Mileage reimbursement. In cents.
      # @return [Integer, nil]
      attribute :mileage_cents, "mileageCents"
      # Visits in the pay period.
      # @return [Integer, nil]
      attribute :visit_count, "visitCount"
      # Visits paid on this entry.
      # @return [Array<String>, nil]
      attribute :visit_ids, "visitIds"
      # How the caregiver is paid.
      # @return [String, nil]
      attribute :payment_method, "paymentMethod"
      # Who approved the entry.
      # @return [String, nil]
      attribute :approved_by_name, "approvedByName"
      # When it was approved.
      # @return [String, nil]
      attribute :approved_at, "approvedAt"
      # When it was paid.
      # @return [String, nil]
      attribute :paid_at, "paidAt"
      # Notes.
      # @return [String, nil]
      attribute :notes, "notes"
      # When the payroll entry was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the payroll entry was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # In-app message threads between people at your agency: one-to-one chats and named group
    # chats. Read-only; start conversations in AveeCare. Every field is always present; a field
    # with no value is `null`.
    class Conversation < Model
      # String representing the object's type. Always `conversation`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the conversation.
      # @return [String, nil]
      attribute :id, "id"
      # User IDs of everyone in the conversation.
      # @return [Array<String>, nil]
      attribute :participant_ids, "participantIds"
      # Whether this is a group chat.
      # @return [Boolean, nil]
      attribute :is_group, "isGroup"
      # Group chat name; `null` for one-to-one chats.
      # @return [String, nil]
      attribute :title, "title"
      # When the most recent message was sent.
      # @return [String, nil]
      attribute :last_message_time, "lastMessageTime"
      # Preview of the most recent message.
      # @return [String, nil]
      attribute :last_message_content, "lastMessageContent"
      # User ID of whoever sent the most recent message.
      # @return [String, nil]
      attribute :last_message_sender_id, "lastMessageSenderId"
      # When the conversation was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the conversation was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Messages in a conversation. Messages you send through the API are sent as the API key's
    # user. Every field is always present; a field with no value is `null`.
    class Message < Model
      # String representing the object's type. Always `message`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the message.
      # @return [String, nil]
      attribute :id, "id"
      # The conversation the message belongs to.
      # @return [String, nil]
      attribute :conversation_id, "conversationId"
      # Message text.
      # @return [String, nil]
      attribute :content, "content"
      # User ID of the sender. Set to the API key's user.
      # @return [String, nil]
      attribute :sender_id, "senderId"
      # When the message was sent.
      # @return [String, nil]
      attribute :sent_at, "sentAt"
      # When the message was last edited.
      # @return [String, nil]
      attribute :edited_at, "editedAt"
      # Whether the sender deleted the message. Deleted messages keep their place in the thread.
      # @return [Boolean, nil]
      attribute :is_deleted, "isDeleted"
      # When the message was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the message was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new message. Any other field is refused with `unknown_field`.
    class MessageCreate < Model
      # The conversation the message belongs to.
      # @return [String, nil]
      attribute :conversation_id, "conversationId"
      # Message text.
      # @return [String, nil]
      attribute :content, "content"
    end

    # Alerts on your agency's alert board, such as a credential about to expire or a missed
    # clock-in, and announcements staff post for caregivers. Every field is always present; a
    # field with no value is `null`.
    class Alert < Model
      # String representing the object's type. Always `alert`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the alert.
      # @return [String, nil]
      attribute :id, "id"
      # Headline.
      # @return [String, nil]
      attribute :name, "name"
      # Details.
      # @return [String, nil]
      attribute :description, "description"
      # How prominently the alert is shown.
      # @return [String, nil]
      attribute :type, "type"
      # Who sees the alert. `Caregiver`, `Patient`, `Visit` and `PatientCareTeam` need
      # `audienceTargetId`.
      # @return [String, nil]
      attribute :audience, "audience"
      # The caregiver, patient or visit the alert is for, when the audience names one.
      # @return [String, nil]
      attribute :audience_target_id, "audienceTargetId"
      # When the alert takes effect.
      # @return [String, nil]
      attribute :time, "time"
      # When the alert should be reviewed or cleared.
      # @return [String, nil]
      attribute :review_date, "reviewDate"
      # When the alert was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the alert was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new alert. Any other field is refused with `unknown_field`.
    class AlertCreate < Model
      # Headline.
      # @return [String, nil]
      attribute :name, "name"
      # Details.
      # @return [String, nil]
      attribute :description, "description"
      # How prominently the alert is shown.
      # @return [String, nil]
      attribute :type, "type"
      # Who sees the alert. `Caregiver`, `Patient`, `Visit` and `PatientCareTeam` need
      # `audienceTargetId`.
      # @return [String, nil]
      attribute :audience, "audience"
      # The caregiver, patient or visit the alert is for, when the audience names one.
      # @return [String, nil]
      attribute :audience_target_id, "audienceTargetId"
      # When the alert takes effect.
      # @return [String, nil]
      attribute :time, "time"
      # When the alert should be reviewed or cleared.
      # @return [String, nil]
      attribute :review_date, "reviewDate"
    end

    # Fields to change on an alert. Send only the fields to change; any other field is refused
    # with `unknown_field`. `time` is set when the alert is created and cannot be changed
    # afterwards.
    class AlertUpdate < Model
      # Headline.
      # @return [String, nil]
      attribute :name, "name"
      # Details.
      # @return [String, nil]
      attribute :description, "description"
      # How prominently the alert is shown.
      # @return [String, nil]
      attribute :type, "type"
      # Who sees the alert. `Caregiver`, `Patient`, `Visit` and `PatientCareTeam` need
      # `audienceTargetId`.
      # @return [String, nil]
      attribute :audience, "audience"
      # The caregiver, patient or visit the alert is for, when the audience names one.
      # @return [String, nil]
      attribute :audience_target_id, "audienceTargetId"
      # When the alert should be reviewed or cleared.
      # @return [String, nil]
      attribute :review_date, "reviewDate"
    end

    # Confirmation that an alert was deleted.
    class AlertDeleted < Model
      # Always `alert`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted alert.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # Your agency's offices (branches). Patients, caregivers and applicants can each belong to one
    # office. There is always exactly one default office. Every field is always present; a field
    # with no value is `null`.
    class Office < Model
      # String representing the object's type. Always `office`.
      # @return [String, nil]
      attribute :object, "object"
      # Unique identifier of the office.
      # @return [String, nil]
      attribute :id, "id"
      # Office name.
      # @return [String, nil]
      attribute :name, "name"
      # Street address.
      # @return [String, nil]
      attribute :address, "address"
      # City.
      # @return [String, nil]
      attribute :city, "city"
      # State, as a two-letter code.
      # @return [String, nil]
      attribute :state, "state"
      # ZIP code.
      # @return [String, nil]
      attribute :zip_code, "zipCode"
      # Main phone number.
      # @return [String, nil]
      attribute :phone, "phone"
      # Whether this is the default office. Making another office the default clears this one.
      # @return [Boolean, nil]
      attribute :is_default, "isDefault"
      # When the office was created.
      # @return [String, nil]
      attribute :created_at, "createdAt"
      # When the office was last changed.
      # @return [String, nil]
      attribute :updated_at, "updatedAt"
    end

    # Fields for a new office. Any other field is refused with `unknown_field`.
    class OfficeCreate < Model
      # Office name.
      # @return [String, nil]
      attribute :name, "name"
      # Street address.
      # @return [String, nil]
      attribute :address, "address"
      # City.
      # @return [String, nil]
      attribute :city, "city"
      # State, as a two-letter code.
      # @return [String, nil]
      attribute :state, "state"
      # ZIP code.
      # @return [String, nil]
      attribute :zip_code, "zipCode"
      # Main phone number.
      # @return [String, nil]
      attribute :phone, "phone"
      # Whether this is the default office. Making another office the default clears this one.
      # @return [Boolean, nil]
      attribute :is_default, "isDefault"
    end

    # Fields to change on an office. Send only the fields to change; any other field is refused
    # with `unknown_field`.
    class OfficeUpdate < Model
      # Office name.
      # @return [String, nil]
      attribute :name, "name"
      # Street address.
      # @return [String, nil]
      attribute :address, "address"
      # City.
      # @return [String, nil]
      attribute :city, "city"
      # State, as a two-letter code.
      # @return [String, nil]
      attribute :state, "state"
      # ZIP code.
      # @return [String, nil]
      attribute :zip_code, "zipCode"
      # Main phone number.
      # @return [String, nil]
      attribute :phone, "phone"
      # Whether this is the default office. Making another office the default clears this one.
      # @return [Boolean, nil]
      attribute :is_default, "isDefault"
    end

    # Confirmation that an office was deleted.
    class OfficeDeleted < Model
      # Always `office`.
      # @return [String, nil]
      attribute :object, "object"
      # ID of the deleted office.
      # @return [String, nil]
      attribute :id, "id"
      # Always `true`.
      # @return [Boolean, nil]
      attribute :deleted, "deleted"
    end

    # The API key making the request.
    class Me < Model
      # Always `me`.
      # @return [String, nil]
      attribute :object, "object"
      # The key's public identifier: the part of the key between `ak_` and the second underscore.
      # @return [String, nil]
      attribute :id, "id"
      # The name given to the key when it was created.
      # @return [String, nil]
      attribute :name, "name"
      # What the key may do. A key without `write` can only read.
      # @return [Array<String>, nil]
      attribute :scopes, "scopes"
      # Role of the person the key belongs to: `RootUser` (agency administrator), `User` (office
      # staff), `Caregiver` or `Patient`. It decides which resources the key can reach.
      # @return [String, nil]
      attribute :role, "role"
      # Email address of the person the key belongs to.
      # @return [String, nil]
      attribute :email, "email"
      # When the key stops working.
      # @return [String, nil]
      attribute :expires_at, "expiresAt"
      # The agency the key belongs to.
      # @return [Aveecare::Models::MeOrganization, nil]
      attribute :organization, "organization", of: "MeOrganization"
    end

    # The agency the key belongs to.
    class MeOrganization < Model
      # ID of the agency.
      # @return [String, nil]
      attribute :id, "id"
      # Agency name.
      # @return [String, nil]
      attribute :name, "name"
    end
  end
end
