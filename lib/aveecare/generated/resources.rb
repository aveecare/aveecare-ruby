# frozen_string_literal: true

# Code generated from the AveeCare OpenAPI specification. DO NOT EDIT.

module Aveecare
  module Resources
    # Patients are the clients your agency provides care to, including prospective clients you
    # have not yet admitted.
    class Patients < Resource
      # List patients.
      #
      # Returns a page of patients. Filters combine with AND. Use `next_cursor` to fetch the next
      # page. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param status [String, nil] Only return patients with this status.
      # @param active [Boolean, nil] Only return active (`true`) or inactive (`false`) patients.
      # @param lifecycle_stage [String, nil] Only return prospects or clients.
      # @param office_id [String, nil] Only return patients served by this office.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Patient>]
      def list(
        status: nil,
        active: nil,
        lifecycle_stage: nil,
        office_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["status"] = status unless status.nil?
        _query["active"] = active unless active.nil?
        _query["lifecycle_stage"] = lifecycle_stage unless lifecycle_stage.nil?
        _query["office_id"] = office_id unless office_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/patients", _query, Models::Patient, request_options)
      end

      # Create a patient.
      #
      # Creates a patient and returns it. Send an `Idempotency-Key` header to make the request
      # safe to retry. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param first_name [String] Given name.
      # @param middle_name [String, nil] Middle name.
      # @param last_name [String] Family name.
      # @param goes_by_name [String, nil] The name the patient prefers to be called.
      # @param date_of_birth [String, Time, Date, nil] Date of birth.
      # @param gender [String, nil] Gender as recorded by the agency.
      # @param primary_language [String, nil] Language the patient is most comfortable speaking.
      # @param email [String, nil] Contact email address.
      # @param active [Boolean, nil] Whether the patient is an active client. Only active clients
      #   are scheduled and billed. A prospective client is always inactive. If you leave it out on
      #   create, it is `false` for a prospect or an `Inactive` or `Discharged` status and `true`
      #   otherwise.
      # @param status [String, nil] The client's status as shown in AveeCare. `Inactive` and
      #   `Discharged` mean the person is no longer receiving care. A prospective client
      #   (`lifecycleStage: Prospect`) reads `Prospect` even if you send `Active`. Creating a
      #   patient with `Prospect` makes them a prospective client. Defaults to `Active`.
      # @param lifecycle_stage [String, nil] Whether this person is a prospective client or an
      #   admitted client. `null` means client. Prospects appear in the prospective-patient pool in
      #   AveeCare, not on the patient roster.
      # @param service_type [String, nil] The main type of service the patient receives.
      # @param address [String, nil] Street address where care is delivered.
      # @param city [String, nil] City of the service address.
      # @param state [String, nil] State of the service address, as a two-letter code.
      # @param zip_code [String, nil] ZIP code of the service address.
      # @param office_id [String, nil] The office (branch) that serves this patient.
      # @param referral_source_id [String, nil] The referral source that sent this patient to you.
      # @param primary_diagnosis_description [String, nil] Primary diagnosis, in plain words.
      # @param fall_risk [Boolean, nil] Whether the patient is a fall risk.
      # @param preferred_caregiver_gender [String, nil] Caregiver gender the patient prefers, if
      #   any.
      # @param scheduling_notes [String, nil] Notes schedulers see when booking visits for this
      #   patient.
      # @param responsible_party_name [String, nil] Person legally responsible for the patient, if
      #   not the patient.
      # @param medicaid_id [String, nil] Medicaid member ID.
      # @param medicare_id [String, nil] Medicare beneficiary identifier.
      # @param insurance_provider [String, nil] Primary insurance company name.
      # @param insurance_id [String, nil] Member ID with the primary insurance.
      # @param insurance_group_number [String, nil] Group number with the primary insurance.
      # @param billing_contact_name [String, nil] Who receives the bills.
      # @param billing_contact_email [String, nil] Email address bills are sent to.
      # @param billing_contact_phone [String, nil] Phone number of the billing contact.
      # @param statement_delivery [String, nil] How statements are delivered.
      # @param payment_method_preference [String, nil] How the patient usually pays.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Patient]
      def create(
        first_name:,
        last_name:,
        middle_name: NOT_GIVEN,
        goes_by_name: NOT_GIVEN,
        date_of_birth: NOT_GIVEN,
        gender: NOT_GIVEN,
        primary_language: NOT_GIVEN,
        email: NOT_GIVEN,
        active: NOT_GIVEN,
        status: NOT_GIVEN,
        lifecycle_stage: NOT_GIVEN,
        service_type: NOT_GIVEN,
        address: NOT_GIVEN,
        city: NOT_GIVEN,
        state: NOT_GIVEN,
        zip_code: NOT_GIVEN,
        office_id: NOT_GIVEN,
        referral_source_id: NOT_GIVEN,
        primary_diagnosis_description: NOT_GIVEN,
        fall_risk: NOT_GIVEN,
        preferred_caregiver_gender: NOT_GIVEN,
        scheduling_notes: NOT_GIVEN,
        responsible_party_name: NOT_GIVEN,
        medicaid_id: NOT_GIVEN,
        medicare_id: NOT_GIVEN,
        insurance_provider: NOT_GIVEN,
        insurance_id: NOT_GIVEN,
        insurance_group_number: NOT_GIVEN,
        billing_contact_name: NOT_GIVEN,
        billing_contact_email: NOT_GIVEN,
        billing_contact_phone: NOT_GIVEN,
        statement_delivery: NOT_GIVEN,
        payment_method_preference: NOT_GIVEN,
        request_options: nil
      )
        _body = {
          "firstName" => first_name,
          "lastName" => last_name
        }
        _body["middleName"] = middle_name unless middle_name.equal?(NOT_GIVEN)
        _body["goesByName"] = goes_by_name unless goes_by_name.equal?(NOT_GIVEN)
        _body["dateOfBirth"] = Serialize.dump(date_of_birth) unless date_of_birth.equal?(NOT_GIVEN)
        _body["gender"] = gender unless gender.equal?(NOT_GIVEN)
        _body["primaryLanguage"] = primary_language unless primary_language.equal?(NOT_GIVEN)
        _body["email"] = email unless email.equal?(NOT_GIVEN)
        _body["active"] = active unless active.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["lifecycleStage"] = lifecycle_stage unless lifecycle_stage.equal?(NOT_GIVEN)
        _body["serviceType"] = service_type unless service_type.equal?(NOT_GIVEN)
        _body["address"] = address unless address.equal?(NOT_GIVEN)
        _body["city"] = city unless city.equal?(NOT_GIVEN)
        _body["state"] = state unless state.equal?(NOT_GIVEN)
        _body["zipCode"] = zip_code unless zip_code.equal?(NOT_GIVEN)
        _body["officeId"] = office_id unless office_id.equal?(NOT_GIVEN)
        _body["referralSourceId"] = referral_source_id unless referral_source_id.equal?(NOT_GIVEN)
        _body["primaryDiagnosisDescription"] = primary_diagnosis_description unless primary_diagnosis_description.equal?(NOT_GIVEN)
        _body["fallRisk"] = fall_risk unless fall_risk.equal?(NOT_GIVEN)
        _body["preferredCaregiverGender"] = preferred_caregiver_gender unless preferred_caregiver_gender.equal?(NOT_GIVEN)
        _body["schedulingNotes"] = scheduling_notes unless scheduling_notes.equal?(NOT_GIVEN)
        _body["responsiblePartyName"] = responsible_party_name unless responsible_party_name.equal?(NOT_GIVEN)
        _body["medicaidId"] = medicaid_id unless medicaid_id.equal?(NOT_GIVEN)
        _body["medicareId"] = medicare_id unless medicare_id.equal?(NOT_GIVEN)
        _body["insuranceProvider"] = insurance_provider unless insurance_provider.equal?(NOT_GIVEN)
        _body["insuranceId"] = insurance_id unless insurance_id.equal?(NOT_GIVEN)
        _body["insuranceGroupNumber"] = insurance_group_number unless insurance_group_number.equal?(NOT_GIVEN)
        _body["billingContactName"] = billing_contact_name unless billing_contact_name.equal?(NOT_GIVEN)
        _body["billingContactEmail"] = billing_contact_email unless billing_contact_email.equal?(NOT_GIVEN)
        _body["billingContactPhone"] = billing_contact_phone unless billing_contact_phone.equal?(NOT_GIVEN)
        _body["statementDelivery"] = statement_delivery unless statement_delivery.equal?(NOT_GIVEN)
        _body["paymentMethodPreference"] = payment_method_preference unless payment_method_preference.equal?(NOT_GIVEN)
        Models::Patient.from_hash(@client.request("POST", "/v1/patients", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a patient.
      #
      # Returns one patient by ID.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the patient.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Patient]
      def retrieve(id, request_options: nil)
        Models::Patient.from_hash(@client.request("GET", "/v1/patients/#{esc(id)}", options: request_options))
      end

      # Update a patient.
      #
      # Changes the fields you send and returns the updated patient. Send `null` to clear an
      # optional field. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the patient.
      # @param first_name [String, nil] Given name.
      # @param middle_name [String, nil] Middle name.
      # @param last_name [String, nil] Family name.
      # @param goes_by_name [String, nil] The name the patient prefers to be called.
      # @param date_of_birth [String, Time, Date, nil] Date of birth.
      # @param gender [String, nil] Gender as recorded by the agency.
      # @param primary_language [String, nil] Language the patient is most comfortable speaking.
      # @param email [String, nil] Contact email address.
      # @param active [Boolean, nil] Whether the patient is an active client. Only active clients
      #   are scheduled and billed. A prospective client is always inactive. If you leave it out on
      #   create, it is `false` for a prospect or an `Inactive` or `Discharged` status and `true`
      #   otherwise.
      # @param status [String, nil] The client's status as shown in AveeCare. `Inactive` and
      #   `Discharged` mean the person is no longer receiving care. A prospective client
      #   (`lifecycleStage: Prospect`) reads `Prospect` even if you send `Active`. Creating a
      #   patient with `Prospect` makes them a prospective client. Defaults to `Active`.
      # @param lifecycle_stage [String, nil] Whether this person is a prospective client or an
      #   admitted client. `null` means client. Prospects appear in the prospective-patient pool in
      #   AveeCare, not on the patient roster.
      # @param service_type [String, nil] The main type of service the patient receives.
      # @param address [String, nil] Street address where care is delivered.
      # @param city [String, nil] City of the service address.
      # @param state [String, nil] State of the service address, as a two-letter code.
      # @param zip_code [String, nil] ZIP code of the service address.
      # @param office_id [String, nil] The office (branch) that serves this patient.
      # @param referral_source_id [String, nil] The referral source that sent this patient to you.
      # @param primary_diagnosis_description [String, nil] Primary diagnosis, in plain words.
      # @param fall_risk [Boolean, nil] Whether the patient is a fall risk.
      # @param preferred_caregiver_gender [String, nil] Caregiver gender the patient prefers, if
      #   any.
      # @param scheduling_notes [String, nil] Notes schedulers see when booking visits for this
      #   patient.
      # @param responsible_party_name [String, nil] Person legally responsible for the patient, if
      #   not the patient.
      # @param medicaid_id [String, nil] Medicaid member ID.
      # @param medicare_id [String, nil] Medicare beneficiary identifier.
      # @param insurance_provider [String, nil] Primary insurance company name.
      # @param insurance_id [String, nil] Member ID with the primary insurance.
      # @param insurance_group_number [String, nil] Group number with the primary insurance.
      # @param billing_contact_name [String, nil] Who receives the bills.
      # @param billing_contact_email [String, nil] Email address bills are sent to.
      # @param billing_contact_phone [String, nil] Phone number of the billing contact.
      # @param statement_delivery [String, nil] How statements are delivered.
      # @param payment_method_preference [String, nil] How the patient usually pays.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Patient]
      def update(
        id,
        first_name: nil,
        middle_name: NOT_GIVEN,
        last_name: nil,
        goes_by_name: NOT_GIVEN,
        date_of_birth: NOT_GIVEN,
        gender: NOT_GIVEN,
        primary_language: NOT_GIVEN,
        email: NOT_GIVEN,
        active: NOT_GIVEN,
        status: NOT_GIVEN,
        lifecycle_stage: NOT_GIVEN,
        service_type: NOT_GIVEN,
        address: NOT_GIVEN,
        city: NOT_GIVEN,
        state: NOT_GIVEN,
        zip_code: NOT_GIVEN,
        office_id: NOT_GIVEN,
        referral_source_id: NOT_GIVEN,
        primary_diagnosis_description: NOT_GIVEN,
        fall_risk: NOT_GIVEN,
        preferred_caregiver_gender: NOT_GIVEN,
        scheduling_notes: NOT_GIVEN,
        responsible_party_name: NOT_GIVEN,
        medicaid_id: NOT_GIVEN,
        medicare_id: NOT_GIVEN,
        insurance_provider: NOT_GIVEN,
        insurance_id: NOT_GIVEN,
        insurance_group_number: NOT_GIVEN,
        billing_contact_name: NOT_GIVEN,
        billing_contact_email: NOT_GIVEN,
        billing_contact_phone: NOT_GIVEN,
        statement_delivery: NOT_GIVEN,
        payment_method_preference: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["firstName"] = first_name unless first_name.nil?
        _body["middleName"] = middle_name unless middle_name.equal?(NOT_GIVEN)
        _body["lastName"] = last_name unless last_name.nil?
        _body["goesByName"] = goes_by_name unless goes_by_name.equal?(NOT_GIVEN)
        _body["dateOfBirth"] = Serialize.dump(date_of_birth) unless date_of_birth.equal?(NOT_GIVEN)
        _body["gender"] = gender unless gender.equal?(NOT_GIVEN)
        _body["primaryLanguage"] = primary_language unless primary_language.equal?(NOT_GIVEN)
        _body["email"] = email unless email.equal?(NOT_GIVEN)
        _body["active"] = active unless active.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["lifecycleStage"] = lifecycle_stage unless lifecycle_stage.equal?(NOT_GIVEN)
        _body["serviceType"] = service_type unless service_type.equal?(NOT_GIVEN)
        _body["address"] = address unless address.equal?(NOT_GIVEN)
        _body["city"] = city unless city.equal?(NOT_GIVEN)
        _body["state"] = state unless state.equal?(NOT_GIVEN)
        _body["zipCode"] = zip_code unless zip_code.equal?(NOT_GIVEN)
        _body["officeId"] = office_id unless office_id.equal?(NOT_GIVEN)
        _body["referralSourceId"] = referral_source_id unless referral_source_id.equal?(NOT_GIVEN)
        _body["primaryDiagnosisDescription"] = primary_diagnosis_description unless primary_diagnosis_description.equal?(NOT_GIVEN)
        _body["fallRisk"] = fall_risk unless fall_risk.equal?(NOT_GIVEN)
        _body["preferredCaregiverGender"] = preferred_caregiver_gender unless preferred_caregiver_gender.equal?(NOT_GIVEN)
        _body["schedulingNotes"] = scheduling_notes unless scheduling_notes.equal?(NOT_GIVEN)
        _body["responsiblePartyName"] = responsible_party_name unless responsible_party_name.equal?(NOT_GIVEN)
        _body["medicaidId"] = medicaid_id unless medicaid_id.equal?(NOT_GIVEN)
        _body["medicareId"] = medicare_id unless medicare_id.equal?(NOT_GIVEN)
        _body["insuranceProvider"] = insurance_provider unless insurance_provider.equal?(NOT_GIVEN)
        _body["insuranceId"] = insurance_id unless insurance_id.equal?(NOT_GIVEN)
        _body["insuranceGroupNumber"] = insurance_group_number unless insurance_group_number.equal?(NOT_GIVEN)
        _body["billingContactName"] = billing_contact_name unless billing_contact_name.equal?(NOT_GIVEN)
        _body["billingContactEmail"] = billing_contact_email unless billing_contact_email.equal?(NOT_GIVEN)
        _body["billingContactPhone"] = billing_contact_phone unless billing_contact_phone.equal?(NOT_GIVEN)
        _body["statementDelivery"] = statement_delivery unless statement_delivery.equal?(NOT_GIVEN)
        _body["paymentMethodPreference"] = payment_method_preference unless payment_method_preference.equal?(NOT_GIVEN)
        Models::Patient.from_hash(@client.request("PATCH", "/v1/patients/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete a patient.
      #
      # Deletes a patient. The patient's visits, notes and other related records are not deleted.
      # Available to keys belonging to office staff. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the patient.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::PatientDeleted]
      def delete(id, request_options: nil)
        Models::PatientDeleted.from_hash(@client.request("DELETE", "/v1/patients/#{esc(id)}", options: request_options))
      end
    end

    # Contacts are family members and other people connected to a patient, such as an emergency
    # contact.
    class Contacts < Resource
      # List contacts.
      #
      # Returns a page of contacts. Filters combine with AND. Use `next_cursor` to fetch the next
      # page.
      #
      # Requires the +read+ scope.
      #
      # @param patient_id [String, nil] Only return contacts of this patient.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Contact>]
      def list(
        patient_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["patient_id"] = patient_id unless patient_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/contacts", _query, Models::Contact, request_options)
      end

      # Create a contact.
      #
      # Creates a contact and returns it. Send an `Idempotency-Key` header to make the request
      # safe to retry. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param patient_id [String] The patient this contact belongs to.
      # @param name [String] Full name.
      # @param relationship [String, nil] Relationship to the patient.
      # @param phone_number [String, nil] Phone number.
      # @param email [String, nil] Email address.
      # @param prefer_email [Boolean, nil] Whether the contact prefers email over phone.
      # @param emergency_contact [Boolean, nil] Whether this person is an emergency contact.
      # @param notification_policy [String, nil] Which updates the contact is notified about.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Contact]
      def create(
        patient_id:,
        name:,
        relationship: NOT_GIVEN,
        phone_number: NOT_GIVEN,
        email: NOT_GIVEN,
        prefer_email: NOT_GIVEN,
        emergency_contact: NOT_GIVEN,
        notification_policy: NOT_GIVEN,
        request_options: nil
      )
        _body = {
          "patientId" => patient_id,
          "name" => name
        }
        _body["relationship"] = relationship unless relationship.equal?(NOT_GIVEN)
        _body["phoneNumber"] = phone_number unless phone_number.equal?(NOT_GIVEN)
        _body["email"] = email unless email.equal?(NOT_GIVEN)
        _body["preferEmail"] = prefer_email unless prefer_email.equal?(NOT_GIVEN)
        _body["emergencyContact"] = emergency_contact unless emergency_contact.equal?(NOT_GIVEN)
        _body["notificationPolicy"] = notification_policy unless notification_policy.equal?(NOT_GIVEN)
        Models::Contact.from_hash(@client.request("POST", "/v1/contacts", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a contact.
      #
      # Returns one contact by ID.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the contact.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Contact]
      def retrieve(id, request_options: nil)
        Models::Contact.from_hash(@client.request("GET", "/v1/contacts/#{esc(id)}", options: request_options))
      end

      # Update a contact.
      #
      # Changes the fields you send and returns the updated contact. Send `null` to clear an
      # optional field. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the contact.
      # @param name [String, nil] Full name.
      # @param relationship [String, nil] Relationship to the patient.
      # @param phone_number [String, nil] Phone number.
      # @param email [String, nil] Email address.
      # @param prefer_email [Boolean, nil] Whether the contact prefers email over phone.
      # @param emergency_contact [Boolean, nil] Whether this person is an emergency contact.
      # @param notification_policy [String, nil] Which updates the contact is notified about.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Contact]
      def update(
        id,
        name: nil,
        relationship: NOT_GIVEN,
        phone_number: NOT_GIVEN,
        email: NOT_GIVEN,
        prefer_email: NOT_GIVEN,
        emergency_contact: NOT_GIVEN,
        notification_policy: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["name"] = name unless name.nil?
        _body["relationship"] = relationship unless relationship.equal?(NOT_GIVEN)
        _body["phoneNumber"] = phone_number unless phone_number.equal?(NOT_GIVEN)
        _body["email"] = email unless email.equal?(NOT_GIVEN)
        _body["preferEmail"] = prefer_email unless prefer_email.equal?(NOT_GIVEN)
        _body["emergencyContact"] = emergency_contact unless emergency_contact.equal?(NOT_GIVEN)
        _body["notificationPolicy"] = notification_policy unless notification_policy.equal?(NOT_GIVEN)
        Models::Contact.from_hash(@client.request("PATCH", "/v1/contacts/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete a contact.
      #
      # Deletes a contact. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the contact.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::ContactDeleted]
      def delete(id, request_options: nil)
        Models::ContactDeleted.from_hash(@client.request("DELETE", "/v1/contacts/#{esc(id)}", options: request_options))
      end
    end

    # Allergies recorded on a patient's profile.
    class Allergies < Resource
      # List allergies.
      #
      # Returns a page of allergies. Filters combine with AND. Use `next_cursor` to fetch the next
      # page.
      #
      # Requires the +read+ scope.
      #
      # @param patient_id [String, nil] Only return allergies of this patient.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Allergy>]
      def list(
        patient_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["patient_id"] = patient_id unless patient_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/allergies", _query, Models::Allergy, request_options)
      end

      # Create an allergy.
      #
      # Creates an allergy and returns it. Send an `Idempotency-Key` header to make the request
      # safe to retry. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param patient_id [String] The patient who has this allergy.
      # @param name [String] What the patient is allergic to.
      # @param description [String, nil] Reaction and other details.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Allergy]
      def create(patient_id:, name:, description: NOT_GIVEN, request_options: nil)
        _body = {
          "patientId" => patient_id,
          "name" => name
        }
        _body["description"] = description unless description.equal?(NOT_GIVEN)
        Models::Allergy.from_hash(@client.request("POST", "/v1/allergies", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve an allergy.
      #
      # Returns one allergy by ID.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the allergy.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Allergy]
      def retrieve(id, request_options: nil)
        Models::Allergy.from_hash(@client.request("GET", "/v1/allergies/#{esc(id)}", options: request_options))
      end

      # Update an allergy.
      #
      # Changes the fields you send and returns the updated allergy. Send `null` to clear an
      # optional field. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the allergy.
      # @param name [String, nil] What the patient is allergic to.
      # @param description [String, nil] Reaction and other details.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Allergy]
      def update(id, name: nil, description: NOT_GIVEN, request_options: nil)
        _body = {}
        _body["name"] = name unless name.nil?
        _body["description"] = description unless description.equal?(NOT_GIVEN)
        Models::Allergy.from_hash(@client.request("PATCH", "/v1/allergies/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete an allergy.
      #
      # Deletes an allergy. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the allergy.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::AllergyDeleted]
      def delete(id, request_options: nil)
        Models::AllergyDeleted.from_hash(@client.request("DELETE", "/v1/allergies/#{esc(id)}", options: request_options))
      end
    end

    # Medications on a patient's medication list, with the schedule caregivers follow when they
    # give or assist with them.
    class Medications < Resource
      # List medications.
      #
      # Returns a page of medications. Filters combine with AND. Use `next_cursor` to fetch the
      # next page.
      #
      # Requires the +read+ scope.
      #
      # @param patient_id [String, nil] Only return medications of this patient.
      # @param status [String, nil] Only return medications with this status.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Medication>]
      def list(
        patient_id: nil,
        status: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["patient_id"] = patient_id unless patient_id.nil?
        _query["status"] = status unless status.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/medications", _query, Models::Medication, request_options)
      end

      # Create a medication.
      #
      # Creates a medication and returns it. Send an `Idempotency-Key` header to make the request
      # safe to retry. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param patient_id [String] The patient who takes this medication.
      # @param name [String] Drug name, without the strength.
      # @param strength [String, nil] Strength per dose unit.
      # @param form [String, nil] Dose form.
      # @param route [String, nil] How it is taken.
      # @param directions [String, nil] Directions as written on the prescription.
      # @param indication [String, nil] What the medication is for.
      # @param schedule_type [String, nil] `Scheduled` for regular doses, `PRN` for as-needed.
      # @param prn_reason [String, nil] For as-needed medications, when to give it.
      # @param prn_max_daily_doses [Integer, nil] For as-needed medications, the most doses
      #   allowed in a day.
      # @param prn_min_interval_hours [Float, nil] For as-needed medications, the minimum hours
      #   between doses.
      # @param start_date [String, Time, Date, nil] Date the patient started the medication.
      # @param status [String, nil] Whether the medication is currently given.
      # @param discontinued_date [String, Time, Date, nil] Date the medication was stopped.
      # @param discontinued_reason [String, nil] Why the medication was stopped.
      # @param prescriber [String, nil] Prescribing clinician.
      # @param prescriber_phone [String, nil] Prescriber's phone number.
      # @param pharmacy [String, nil] Pharmacy that fills the prescription.
      # @param pharmacy_phone [String, nil] Pharmacy phone number.
      # @param requires_witness [Boolean, nil] Whether a second person must witness each dose.
      # @param quantity_on_hand [Float, nil] Doses currently on hand.
      # @param refills_remaining [Integer, nil] Refills left on the prescription.
      # @param notes [String, nil] Other notes.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Medication]
      def create(
        patient_id:,
        name:,
        strength: NOT_GIVEN,
        form: NOT_GIVEN,
        route: NOT_GIVEN,
        directions: NOT_GIVEN,
        indication: NOT_GIVEN,
        schedule_type: NOT_GIVEN,
        prn_reason: NOT_GIVEN,
        prn_max_daily_doses: NOT_GIVEN,
        prn_min_interval_hours: NOT_GIVEN,
        start_date: NOT_GIVEN,
        status: NOT_GIVEN,
        discontinued_date: NOT_GIVEN,
        discontinued_reason: NOT_GIVEN,
        prescriber: NOT_GIVEN,
        prescriber_phone: NOT_GIVEN,
        pharmacy: NOT_GIVEN,
        pharmacy_phone: NOT_GIVEN,
        requires_witness: NOT_GIVEN,
        quantity_on_hand: NOT_GIVEN,
        refills_remaining: NOT_GIVEN,
        notes: NOT_GIVEN,
        request_options: nil
      )
        _body = {
          "patientId" => patient_id,
          "name" => name
        }
        _body["strength"] = strength unless strength.equal?(NOT_GIVEN)
        _body["form"] = form unless form.equal?(NOT_GIVEN)
        _body["route"] = route unless route.equal?(NOT_GIVEN)
        _body["directions"] = directions unless directions.equal?(NOT_GIVEN)
        _body["indication"] = indication unless indication.equal?(NOT_GIVEN)
        _body["scheduleType"] = schedule_type unless schedule_type.equal?(NOT_GIVEN)
        _body["prnReason"] = prn_reason unless prn_reason.equal?(NOT_GIVEN)
        _body["prnMaxDailyDoses"] = prn_max_daily_doses unless prn_max_daily_doses.equal?(NOT_GIVEN)
        _body["prnMinIntervalHours"] = prn_min_interval_hours unless prn_min_interval_hours.equal?(NOT_GIVEN)
        _body["startDate"] = Serialize.dump(start_date) unless start_date.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["discontinuedDate"] = Serialize.dump(discontinued_date) unless discontinued_date.equal?(NOT_GIVEN)
        _body["discontinuedReason"] = discontinued_reason unless discontinued_reason.equal?(NOT_GIVEN)
        _body["prescriber"] = prescriber unless prescriber.equal?(NOT_GIVEN)
        _body["prescriberPhone"] = prescriber_phone unless prescriber_phone.equal?(NOT_GIVEN)
        _body["pharmacy"] = pharmacy unless pharmacy.equal?(NOT_GIVEN)
        _body["pharmacyPhone"] = pharmacy_phone unless pharmacy_phone.equal?(NOT_GIVEN)
        _body["requiresWitness"] = requires_witness unless requires_witness.equal?(NOT_GIVEN)
        _body["quantityOnHand"] = quantity_on_hand unless quantity_on_hand.equal?(NOT_GIVEN)
        _body["refillsRemaining"] = refills_remaining unless refills_remaining.equal?(NOT_GIVEN)
        _body["notes"] = notes unless notes.equal?(NOT_GIVEN)
        Models::Medication.from_hash(@client.request("POST", "/v1/medications", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a medication.
      #
      # Returns one medication by ID.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the medication.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Medication]
      def retrieve(id, request_options: nil)
        Models::Medication.from_hash(@client.request("GET", "/v1/medications/#{esc(id)}", options: request_options))
      end

      # Update a medication.
      #
      # Changes the fields you send and returns the updated medication. Send `null` to clear an
      # optional field. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the medication.
      # @param name [String, nil] Drug name, without the strength.
      # @param strength [String, nil] Strength per dose unit.
      # @param form [String, nil] Dose form.
      # @param route [String, nil] How it is taken.
      # @param directions [String, nil] Directions as written on the prescription.
      # @param indication [String, nil] What the medication is for.
      # @param schedule_type [String, nil] `Scheduled` for regular doses, `PRN` for as-needed.
      # @param prn_reason [String, nil] For as-needed medications, when to give it.
      # @param prn_max_daily_doses [Integer, nil] For as-needed medications, the most doses
      #   allowed in a day.
      # @param prn_min_interval_hours [Float, nil] For as-needed medications, the minimum hours
      #   between doses.
      # @param start_date [String, Time, Date, nil] Date the patient started the medication.
      # @param status [String, nil] Whether the medication is currently given.
      # @param discontinued_date [String, Time, Date, nil] Date the medication was stopped.
      # @param discontinued_reason [String, nil] Why the medication was stopped.
      # @param prescriber [String, nil] Prescribing clinician.
      # @param prescriber_phone [String, nil] Prescriber's phone number.
      # @param pharmacy [String, nil] Pharmacy that fills the prescription.
      # @param pharmacy_phone [String, nil] Pharmacy phone number.
      # @param requires_witness [Boolean, nil] Whether a second person must witness each dose.
      # @param quantity_on_hand [Float, nil] Doses currently on hand.
      # @param refills_remaining [Integer, nil] Refills left on the prescription.
      # @param notes [String, nil] Other notes.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Medication]
      def update(
        id,
        name: nil,
        strength: NOT_GIVEN,
        form: NOT_GIVEN,
        route: NOT_GIVEN,
        directions: NOT_GIVEN,
        indication: NOT_GIVEN,
        schedule_type: NOT_GIVEN,
        prn_reason: NOT_GIVEN,
        prn_max_daily_doses: NOT_GIVEN,
        prn_min_interval_hours: NOT_GIVEN,
        start_date: NOT_GIVEN,
        status: NOT_GIVEN,
        discontinued_date: NOT_GIVEN,
        discontinued_reason: NOT_GIVEN,
        prescriber: NOT_GIVEN,
        prescriber_phone: NOT_GIVEN,
        pharmacy: NOT_GIVEN,
        pharmacy_phone: NOT_GIVEN,
        requires_witness: NOT_GIVEN,
        quantity_on_hand: NOT_GIVEN,
        refills_remaining: NOT_GIVEN,
        notes: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["name"] = name unless name.nil?
        _body["strength"] = strength unless strength.equal?(NOT_GIVEN)
        _body["form"] = form unless form.equal?(NOT_GIVEN)
        _body["route"] = route unless route.equal?(NOT_GIVEN)
        _body["directions"] = directions unless directions.equal?(NOT_GIVEN)
        _body["indication"] = indication unless indication.equal?(NOT_GIVEN)
        _body["scheduleType"] = schedule_type unless schedule_type.equal?(NOT_GIVEN)
        _body["prnReason"] = prn_reason unless prn_reason.equal?(NOT_GIVEN)
        _body["prnMaxDailyDoses"] = prn_max_daily_doses unless prn_max_daily_doses.equal?(NOT_GIVEN)
        _body["prnMinIntervalHours"] = prn_min_interval_hours unless prn_min_interval_hours.equal?(NOT_GIVEN)
        _body["startDate"] = Serialize.dump(start_date) unless start_date.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["discontinuedDate"] = Serialize.dump(discontinued_date) unless discontinued_date.equal?(NOT_GIVEN)
        _body["discontinuedReason"] = discontinued_reason unless discontinued_reason.equal?(NOT_GIVEN)
        _body["prescriber"] = prescriber unless prescriber.equal?(NOT_GIVEN)
        _body["prescriberPhone"] = prescriber_phone unless prescriber_phone.equal?(NOT_GIVEN)
        _body["pharmacy"] = pharmacy unless pharmacy.equal?(NOT_GIVEN)
        _body["pharmacyPhone"] = pharmacy_phone unless pharmacy_phone.equal?(NOT_GIVEN)
        _body["requiresWitness"] = requires_witness unless requires_witness.equal?(NOT_GIVEN)
        _body["quantityOnHand"] = quantity_on_hand unless quantity_on_hand.equal?(NOT_GIVEN)
        _body["refillsRemaining"] = refills_remaining unless refills_remaining.equal?(NOT_GIVEN)
        _body["notes"] = notes unless notes.equal?(NOT_GIVEN)
        Models::Medication.from_hash(@client.request("PATCH", "/v1/medications/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete a medication.
      #
      # Deletes a medication. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the medication.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::MedicationDeleted]
      def delete(id, request_options: nil)
        Models::MedicationDeleted.from_hash(@client.request("DELETE", "/v1/medications/#{esc(id)}", options: request_options))
      end
    end

    # Goals of care set for a patient, such as walking to the mailbox unaided.
    class CareGoals < Resource
      # List care goals.
      #
      # Returns a page of care goals. Filters combine with AND. Use `next_cursor` to fetch the
      # next page.
      #
      # Requires the +read+ scope.
      #
      # @param patient_id [String, nil] Only return goals of this patient.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::CareGoal>]
      def list(
        patient_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["patient_id"] = patient_id unless patient_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/care-goals", _query, Models::CareGoal, request_options)
      end

      # Create a care goal.
      #
      # Creates a care goal and returns it. Send an `Idempotency-Key` header to make the request
      # safe to retry. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param patient_id [String] The patient this goal is for.
      # @param name [String] Short name of the goal.
      # @param description [String, nil] What success looks like.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::CareGoal]
      def create(patient_id:, name:, description: NOT_GIVEN, request_options: nil)
        _body = {
          "patientId" => patient_id,
          "name" => name
        }
        _body["description"] = description unless description.equal?(NOT_GIVEN)
        Models::CareGoal.from_hash(@client.request("POST", "/v1/care-goals", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a care goal.
      #
      # Returns one care goal by ID.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the care goal.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::CareGoal]
      def retrieve(id, request_options: nil)
        Models::CareGoal.from_hash(@client.request("GET", "/v1/care-goals/#{esc(id)}", options: request_options))
      end

      # Update a care goal.
      #
      # Changes the fields you send and returns the updated care goal. Send `null` to clear an
      # optional field. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the care goal.
      # @param name [String, nil] Short name of the goal.
      # @param description [String, nil] What success looks like.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::CareGoal]
      def update(id, name: nil, description: NOT_GIVEN, request_options: nil)
        _body = {}
        _body["name"] = name unless name.nil?
        _body["description"] = description unless description.equal?(NOT_GIVEN)
        Models::CareGoal.from_hash(@client.request("PATCH", "/v1/care-goals/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete a care goal.
      #
      # Deletes a care goal. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the care goal.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::CareGoalDeleted]
      def delete(id, request_options: nil)
        Models::CareGoalDeleted.from_hash(@client.request("DELETE", "/v1/care-goals/#{esc(id)}", options: request_options))
      end
    end

    # Notes your staff and caregivers keep on a patient's profile.
    class PatientNotes < Resource
      # List patient notes.
      #
      # Returns a page of patient notes. Filters combine with AND. Use `next_cursor` to fetch the
      # next page. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param patient_id [String, nil] Only return notes about this patient.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::PatientNote>]
      def list(
        patient_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["patient_id"] = patient_id unless patient_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/patient-notes", _query, Models::PatientNote, request_options)
      end

      # Create a patient note.
      #
      # Creates a patient note and returns it. Send an `Idempotency-Key` header to make the
      # request safe to retry. Available to keys belonging to office staff and caregivers. With a
      # caregiver's or patient's key, a saved record that key cannot read back is answered with
      # only `object` and `id`. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param patient_id [String] The patient the note is about.
      # @param content [String] The note.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::PatientNote]
      def create(patient_id:, content:, request_options: nil)
        _body = {
          "patientId" => patient_id,
          "content" => content
        }
        Models::PatientNote.from_hash(@client.request("POST", "/v1/patient-notes", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a patient note.
      #
      # Returns one patient note by ID. Available to keys belonging to office staff and
      # caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the patient note.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::PatientNote]
      def retrieve(id, request_options: nil)
        Models::PatientNote.from_hash(@client.request("GET", "/v1/patient-notes/#{esc(id)}", options: request_options))
      end

      # Update a patient note.
      #
      # Changes the fields you send and returns the updated patient note. Send `null` to clear an
      # optional field. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the patient note.
      # @param content [String, nil] The note.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::PatientNote]
      def update(id, content: nil, request_options: nil)
        _body = {}
        _body["content"] = content unless content.nil?
        Models::PatientNote.from_hash(@client.request("PATCH", "/v1/patient-notes/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete a patient note.
      #
      # Deletes a patient note. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the patient note.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::PatientNoteDeleted]
      def delete(id, request_options: nil)
        Models::PatientNoteDeleted.from_hash(@client.request("DELETE", "/v1/patient-notes/#{esc(id)}", options: request_options))
      end
    end

    # The medication administration record (MAR): each dose a caregiver gave, or the reason it was
    # not given. Read-only.
    class MedicationAdministrations < Resource
      # List medication administrations.
      #
      # Returns a page of medication administrations. Filters combine with AND. Use `next_cursor`
      # to fetch the next page.
      #
      # Requires the +read+ scope.
      #
      # @param patient_id [String, nil] Only return doses for this patient.
      # @param medication_id [String, nil] Only return doses of this medication.
      # @param scheduled_date [String, Time, Date, nil] Only return doses due on this date.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::MedicationAdministration>]
      def list(
        patient_id: nil,
        medication_id: nil,
        scheduled_date: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["patient_id"] = patient_id unless patient_id.nil?
        _query["medication_id"] = medication_id unless medication_id.nil?
        _query["scheduled_date"] = scheduled_date unless scheduled_date.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/medication-administrations", _query, Models::MedicationAdministration, request_options)
      end

      # Retrieve a medication administration.
      #
      # Returns one medication administration by ID.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the medication administration.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::MedicationAdministration]
      def retrieve(id, request_options: nil)
        Models::MedicationAdministration.from_hash(@client.request("GET", "/v1/medication-administrations/#{esc(id)}", options: request_options))
      end
    end

    # OASIS assessments recorded for Medicare home health patients. This lists each assessment and
    # its status; the item-level answers are not included. Read-only.
    class OasisAssessments < Resource
      # List OASIS assessments.
      #
      # Returns a page of OASIS assessments. Filters combine with AND. Use `next_cursor` to fetch
      # the next page. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param patient_id [String, nil] Only return assessments of this patient.
      # @param status [String, nil] Only return assessments with this status.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::OasisAssessment>]
      def list(
        patient_id: nil,
        status: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["patient_id"] = patient_id unless patient_id.nil?
        _query["status"] = status unless status.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/oasis-assessments", _query, Models::OasisAssessment, request_options)
      end

      # Retrieve an OASIS assessment.
      #
      # Returns one OASIS assessment by ID. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the OASIS assessment.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::OasisAssessment]
      def retrieve(id, request_options: nil)
        Models::OasisAssessment.from_hash(@client.request("GET", "/v1/oasis-assessments/#{esc(id)}", options: request_options))
      end
    end

    # Caregivers are the aides, nurses and therapists your agency schedules to visit patients.
    class Caregivers < Resource
      # List caregivers.
      #
      # Returns a page of caregivers. Filters combine with AND. Use `next_cursor` to fetch the
      # next page. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param status [String, nil] Only return caregivers with this employment status.
      # @param active [Boolean, nil] Only return caregivers who can (`true`) or cannot (`false`)
      #   be scheduled.
      # @param office_id [String, nil] Only return caregivers from this office.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Caregiver>]
      def list(
        status: nil,
        active: nil,
        office_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["status"] = status unless status.nil?
        _query["active"] = active unless active.nil?
        _query["office_id"] = office_id unless office_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/caregivers", _query, Models::Caregiver, request_options)
      end

      # Create a caregiver.
      #
      # Creates a caregiver and returns it. Send an `Idempotency-Key` header to make the request
      # safe to retry. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param first_name [String] Given name.
      # @param middle_name [String, nil] Middle name.
      # @param last_name [String] Family name.
      # @param goes_by_name [String, nil] The name the caregiver prefers to be called.
      # @param email [String, nil] Work email address.
      # @param status [String, nil] Employment status.
      # @param active [Boolean, nil] Whether the caregiver can be scheduled. If you leave it out
      #   on create, it is `false` for an `Inactive` status and `true` otherwise.
      # @param date_of_birth [String, Time, Date, nil] Date of birth.
      # @param gender [String, nil] Gender as recorded by the agency.
      # @param primary_language [String, nil] Language the caregiver is most comfortable speaking.
      # @param address [String, nil] Home street address.
      # @param city [String, nil] City.
      # @param state [String, nil] State, as a two-letter code.
      # @param zip_code [String, nil] ZIP code.
      # @param office_id [String, nil] The office (branch) the caregiver works from.
      # @param license_type [String, nil] License or credential type.
      # @param npi_number [String, nil] National Provider Identifier, for licensed clinicians.
      # @param state_license_number [String, nil] State license number.
      # @param state_license_state [String, nil] State that issued the license.
      # @param state_license_expiry [String, nil] License expiry date, as `YYYY-MM-DD`.
      # @param is_live_in_caregiver [Boolean, nil] Whether the caregiver works live-in shifts.
      # @param scheduling_notes [String, nil] Notes schedulers see when booking this caregiver.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Caregiver]
      def create(
        first_name:,
        last_name:,
        middle_name: NOT_GIVEN,
        goes_by_name: NOT_GIVEN,
        email: NOT_GIVEN,
        status: NOT_GIVEN,
        active: NOT_GIVEN,
        date_of_birth: NOT_GIVEN,
        gender: NOT_GIVEN,
        primary_language: NOT_GIVEN,
        address: NOT_GIVEN,
        city: NOT_GIVEN,
        state: NOT_GIVEN,
        zip_code: NOT_GIVEN,
        office_id: NOT_GIVEN,
        license_type: NOT_GIVEN,
        npi_number: NOT_GIVEN,
        state_license_number: NOT_GIVEN,
        state_license_state: NOT_GIVEN,
        state_license_expiry: NOT_GIVEN,
        is_live_in_caregiver: NOT_GIVEN,
        scheduling_notes: NOT_GIVEN,
        request_options: nil
      )
        _body = {
          "firstName" => first_name,
          "lastName" => last_name
        }
        _body["middleName"] = middle_name unless middle_name.equal?(NOT_GIVEN)
        _body["goesByName"] = goes_by_name unless goes_by_name.equal?(NOT_GIVEN)
        _body["email"] = email unless email.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["active"] = active unless active.equal?(NOT_GIVEN)
        _body["dateOfBirth"] = Serialize.dump(date_of_birth) unless date_of_birth.equal?(NOT_GIVEN)
        _body["gender"] = gender unless gender.equal?(NOT_GIVEN)
        _body["primaryLanguage"] = primary_language unless primary_language.equal?(NOT_GIVEN)
        _body["address"] = address unless address.equal?(NOT_GIVEN)
        _body["city"] = city unless city.equal?(NOT_GIVEN)
        _body["state"] = state unless state.equal?(NOT_GIVEN)
        _body["zipCode"] = zip_code unless zip_code.equal?(NOT_GIVEN)
        _body["officeId"] = office_id unless office_id.equal?(NOT_GIVEN)
        _body["licenseType"] = license_type unless license_type.equal?(NOT_GIVEN)
        _body["npiNumber"] = npi_number unless npi_number.equal?(NOT_GIVEN)
        _body["stateLicenseNumber"] = state_license_number unless state_license_number.equal?(NOT_GIVEN)
        _body["stateLicenseState"] = state_license_state unless state_license_state.equal?(NOT_GIVEN)
        _body["stateLicenseExpiry"] = state_license_expiry unless state_license_expiry.equal?(NOT_GIVEN)
        _body["isLiveInCaregiver"] = is_live_in_caregiver unless is_live_in_caregiver.equal?(NOT_GIVEN)
        _body["schedulingNotes"] = scheduling_notes unless scheduling_notes.equal?(NOT_GIVEN)
        Models::Caregiver.from_hash(@client.request("POST", "/v1/caregivers", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a caregiver.
      #
      # Returns one caregiver by ID. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the caregiver.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Caregiver]
      def retrieve(id, request_options: nil)
        Models::Caregiver.from_hash(@client.request("GET", "/v1/caregivers/#{esc(id)}", options: request_options))
      end

      # Update a caregiver.
      #
      # Changes the fields you send and returns the updated caregiver. Send `null` to clear an
      # optional field. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the caregiver.
      # @param first_name [String, nil] Given name.
      # @param middle_name [String, nil] Middle name.
      # @param last_name [String, nil] Family name.
      # @param goes_by_name [String, nil] The name the caregiver prefers to be called.
      # @param email [String, nil] Work email address.
      # @param status [String, nil] Employment status.
      # @param active [Boolean, nil] Whether the caregiver can be scheduled. If you leave it out
      #   on create, it is `false` for an `Inactive` status and `true` otherwise.
      # @param date_of_birth [String, Time, Date, nil] Date of birth.
      # @param gender [String, nil] Gender as recorded by the agency.
      # @param primary_language [String, nil] Language the caregiver is most comfortable speaking.
      # @param address [String, nil] Home street address.
      # @param city [String, nil] City.
      # @param state [String, nil] State, as a two-letter code.
      # @param zip_code [String, nil] ZIP code.
      # @param office_id [String, nil] The office (branch) the caregiver works from.
      # @param license_type [String, nil] License or credential type.
      # @param npi_number [String, nil] National Provider Identifier, for licensed clinicians.
      # @param state_license_number [String, nil] State license number.
      # @param state_license_state [String, nil] State that issued the license.
      # @param state_license_expiry [String, nil] License expiry date, as `YYYY-MM-DD`.
      # @param is_live_in_caregiver [Boolean, nil] Whether the caregiver works live-in shifts.
      # @param scheduling_notes [String, nil] Notes schedulers see when booking this caregiver.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Caregiver]
      def update(
        id,
        first_name: nil,
        middle_name: NOT_GIVEN,
        last_name: nil,
        goes_by_name: NOT_GIVEN,
        email: NOT_GIVEN,
        status: NOT_GIVEN,
        active: NOT_GIVEN,
        date_of_birth: NOT_GIVEN,
        gender: NOT_GIVEN,
        primary_language: NOT_GIVEN,
        address: NOT_GIVEN,
        city: NOT_GIVEN,
        state: NOT_GIVEN,
        zip_code: NOT_GIVEN,
        office_id: NOT_GIVEN,
        license_type: NOT_GIVEN,
        npi_number: NOT_GIVEN,
        state_license_number: NOT_GIVEN,
        state_license_state: NOT_GIVEN,
        state_license_expiry: NOT_GIVEN,
        is_live_in_caregiver: NOT_GIVEN,
        scheduling_notes: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["firstName"] = first_name unless first_name.nil?
        _body["middleName"] = middle_name unless middle_name.equal?(NOT_GIVEN)
        _body["lastName"] = last_name unless last_name.nil?
        _body["goesByName"] = goes_by_name unless goes_by_name.equal?(NOT_GIVEN)
        _body["email"] = email unless email.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["active"] = active unless active.equal?(NOT_GIVEN)
        _body["dateOfBirth"] = Serialize.dump(date_of_birth) unless date_of_birth.equal?(NOT_GIVEN)
        _body["gender"] = gender unless gender.equal?(NOT_GIVEN)
        _body["primaryLanguage"] = primary_language unless primary_language.equal?(NOT_GIVEN)
        _body["address"] = address unless address.equal?(NOT_GIVEN)
        _body["city"] = city unless city.equal?(NOT_GIVEN)
        _body["state"] = state unless state.equal?(NOT_GIVEN)
        _body["zipCode"] = zip_code unless zip_code.equal?(NOT_GIVEN)
        _body["officeId"] = office_id unless office_id.equal?(NOT_GIVEN)
        _body["licenseType"] = license_type unless license_type.equal?(NOT_GIVEN)
        _body["npiNumber"] = npi_number unless npi_number.equal?(NOT_GIVEN)
        _body["stateLicenseNumber"] = state_license_number unless state_license_number.equal?(NOT_GIVEN)
        _body["stateLicenseState"] = state_license_state unless state_license_state.equal?(NOT_GIVEN)
        _body["stateLicenseExpiry"] = state_license_expiry unless state_license_expiry.equal?(NOT_GIVEN)
        _body["isLiveInCaregiver"] = is_live_in_caregiver unless is_live_in_caregiver.equal?(NOT_GIVEN)
        _body["schedulingNotes"] = scheduling_notes unless scheduling_notes.equal?(NOT_GIVEN)
        Models::Caregiver.from_hash(@client.request("PATCH", "/v1/caregivers/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete a caregiver.
      #
      # Deletes a caregiver. The caregiver's past visits and other related records are not
      # deleted. Available to keys belonging to office staff. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the caregiver.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::CaregiverDeleted]
      def delete(id, request_options: nil)
        Models::CaregiverDeleted.from_hash(@client.request("DELETE", "/v1/caregivers/#{esc(id)}", options: request_options))
      end
    end

    # Notes your staff keep on a caregiver's profile.
    class CaregiverNotes < Resource
      # List caregiver notes.
      #
      # Returns a page of caregiver notes. Filters combine with AND. Use `next_cursor` to fetch
      # the next page. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param caregiver_id [String, nil] Only return notes about this caregiver.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::CaregiverNote>]
      def list(
        caregiver_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["caregiver_id"] = caregiver_id unless caregiver_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/caregiver-notes", _query, Models::CaregiverNote, request_options)
      end

      # Create a caregiver note.
      #
      # Creates a caregiver note and returns it. Send an `Idempotency-Key` header to make the
      # request safe to retry. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param caregiver_id [String] The caregiver the note is about.
      # @param content [String] The note.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::CaregiverNote]
      def create(caregiver_id:, content:, request_options: nil)
        _body = {
          "caregiverId" => caregiver_id,
          "content" => content
        }
        Models::CaregiverNote.from_hash(@client.request("POST", "/v1/caregiver-notes", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a caregiver note.
      #
      # Returns one caregiver note by ID. Available to keys belonging to office staff and
      # caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the caregiver note.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::CaregiverNote]
      def retrieve(id, request_options: nil)
        Models::CaregiverNote.from_hash(@client.request("GET", "/v1/caregiver-notes/#{esc(id)}", options: request_options))
      end

      # Update a caregiver note.
      #
      # Changes the fields you send and returns the updated caregiver note. Send `null` to clear
      # an optional field. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the caregiver note.
      # @param content [String, nil] The note.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::CaregiverNote]
      def update(id, content: nil, request_options: nil)
        _body = {}
        _body["content"] = content unless content.nil?
        Models::CaregiverNote.from_hash(@client.request("PATCH", "/v1/caregiver-notes/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete a caregiver note.
      #
      # Deletes a caregiver note. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the caregiver note.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::CaregiverNoteDeleted]
      def delete(id, request_options: nil)
        Models::CaregiverNoteDeleted.from_hash(@client.request("DELETE", "/v1/caregiver-notes/#{esc(id)}", options: request_options))
      end
    end

    # Certifications, licenses and background checks on a caregiver's profile, with their expiry
    # dates.
    class Certifications < Resource
      # List certifications.
      #
      # Returns a page of certifications. Filters combine with AND. Use `next_cursor` to fetch the
      # next page. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param caregiver_id [String, nil] Only return certifications of this caregiver.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Certification>]
      def list(
        caregiver_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["caregiver_id"] = caregiver_id unless caregiver_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/certifications", _query, Models::Certification, request_options)
      end

      # Create a certification.
      #
      # Creates a certification and returns it. Send an `Idempotency-Key` header to make the
      # request safe to retry. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param caregiver_id [String] The caregiver who holds it.
      # @param name [String] Name of the certification.
      # @param cert_kind [String, nil] Kind of credential, such as a certification or a background
      #   check.
      # @param obtained [String, Time, Date, nil] Date it was obtained.
      # @param expires [String, Time, Date, nil] Date it expires.
      # @param check_agency [String, nil] For background checks, the agency that ran the check.
      # @param check_state [String, nil] For background checks, the state the check covers.
      # @param check_result [String, nil] For background checks, the result.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Certification]
      def create(
        caregiver_id:,
        name:,
        cert_kind: NOT_GIVEN,
        obtained: NOT_GIVEN,
        expires: NOT_GIVEN,
        check_agency: NOT_GIVEN,
        check_state: NOT_GIVEN,
        check_result: NOT_GIVEN,
        request_options: nil
      )
        _body = {
          "caregiverId" => caregiver_id,
          "name" => name
        }
        _body["certKind"] = cert_kind unless cert_kind.equal?(NOT_GIVEN)
        _body["obtained"] = Serialize.dump(obtained) unless obtained.equal?(NOT_GIVEN)
        _body["expires"] = Serialize.dump(expires) unless expires.equal?(NOT_GIVEN)
        _body["checkAgency"] = check_agency unless check_agency.equal?(NOT_GIVEN)
        _body["checkState"] = check_state unless check_state.equal?(NOT_GIVEN)
        _body["checkResult"] = check_result unless check_result.equal?(NOT_GIVEN)
        Models::Certification.from_hash(@client.request("POST", "/v1/certifications", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a certification.
      #
      # Returns one certification by ID. Available to keys belonging to office staff and
      # caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the certification.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Certification]
      def retrieve(id, request_options: nil)
        Models::Certification.from_hash(@client.request("GET", "/v1/certifications/#{esc(id)}", options: request_options))
      end

      # Update a certification.
      #
      # Changes the fields you send and returns the updated certification. Send `null` to clear an
      # optional field. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the certification.
      # @param name [String, nil] Name of the certification.
      # @param cert_kind [String, nil] Kind of credential, such as a certification or a background
      #   check.
      # @param obtained [String, Time, Date, nil] Date it was obtained.
      # @param expires [String, Time, Date, nil] Date it expires.
      # @param check_agency [String, nil] For background checks, the agency that ran the check.
      # @param check_state [String, nil] For background checks, the state the check covers.
      # @param check_result [String, nil] For background checks, the result.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Certification]
      def update(
        id,
        name: nil,
        cert_kind: NOT_GIVEN,
        obtained: NOT_GIVEN,
        expires: NOT_GIVEN,
        check_agency: NOT_GIVEN,
        check_state: NOT_GIVEN,
        check_result: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["name"] = name unless name.nil?
        _body["certKind"] = cert_kind unless cert_kind.equal?(NOT_GIVEN)
        _body["obtained"] = Serialize.dump(obtained) unless obtained.equal?(NOT_GIVEN)
        _body["expires"] = Serialize.dump(expires) unless expires.equal?(NOT_GIVEN)
        _body["checkAgency"] = check_agency unless check_agency.equal?(NOT_GIVEN)
        _body["checkState"] = check_state unless check_state.equal?(NOT_GIVEN)
        _body["checkResult"] = check_result unless check_result.equal?(NOT_GIVEN)
        Models::Certification.from_hash(@client.request("PATCH", "/v1/certifications/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete a certification.
      #
      # Deletes a certification. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the certification.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::CertificationDeleted]
      def delete(id, request_options: nil)
        Models::CertificationDeleted.from_hash(@client.request("DELETE", "/v1/certifications/#{esc(id)}", options: request_options))
      end
    end

    # When a caregiver can or cannot work. A window is either a weekly recurring time on one
    # weekday, or a one-off date range such as time off.
    class Availability < Resource
      # List availability windows.
      #
      # Returns a page of availability windows. Filters combine with AND. Use `next_cursor` to
      # fetch the next page. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param caregiver_id [String, nil] Only return windows of this caregiver.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Availability>]
      def list(
        caregiver_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["caregiver_id"] = caregiver_id unless caregiver_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/availability", _query, Models::Availability, request_options)
      end

      # Create an availability window.
      #
      # Creates an availability window and returns it. Send an `Idempotency-Key` header to make
      # the request safe to retry. Available to keys belonging to office staff and caregivers.
      # With a caregiver's or patient's key, a saved record that key cannot read back is answered
      # with only `object` and `id`. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param caregiver_id [String] The caregiver.
      # @param is_available [Boolean, nil] `true` when the caregiver can work in this window,
      #   `false` for time off.
      # @param recurring [Boolean, nil] Whether the window repeats weekly.
      # @param day_of_week [Integer, nil] For weekly windows, the weekday: 0 is Sunday, 6 is
      #   Saturday.
      # @param start_minute [Integer, nil] For weekly windows, the start time in minutes after
      #   midnight.
      # @param end_minute [Integer, nil] For weekly windows, the end time in minutes after
      #   midnight.
      # @param interval_weeks [Integer, nil] For weekly windows, repeat every this many weeks.
      #   Defaults to every week.
      # @param effective_from [String, Time, Date, nil] First date a weekly window applies.
      # @param effective_to [String, Time, Date, nil] Last date a weekly window applies; `null`
      #   for no end.
      # @param start_date_time [String, Time, Date, nil] For one-off windows, when it starts.
      # @param end_date_time [String, Time, Date, nil] For one-off windows, when it ends.
      # @param is_preferred [Boolean, nil] Whether these are the caregiver's preferred hours.
      # @param reason [String, nil] Why the caregiver is unavailable, for time off.
      # @param is_active [Boolean, nil] Whether the window is in effect.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Availability]
      def create(
        caregiver_id:,
        is_available: NOT_GIVEN,
        recurring: NOT_GIVEN,
        day_of_week: NOT_GIVEN,
        start_minute: NOT_GIVEN,
        end_minute: NOT_GIVEN,
        interval_weeks: NOT_GIVEN,
        effective_from: NOT_GIVEN,
        effective_to: NOT_GIVEN,
        start_date_time: NOT_GIVEN,
        end_date_time: NOT_GIVEN,
        is_preferred: NOT_GIVEN,
        reason: NOT_GIVEN,
        is_active: NOT_GIVEN,
        request_options: nil
      )
        _body = {
          "caregiverId" => caregiver_id
        }
        _body["isAvailable"] = is_available unless is_available.equal?(NOT_GIVEN)
        _body["recurring"] = recurring unless recurring.equal?(NOT_GIVEN)
        _body["dayOfWeek"] = day_of_week unless day_of_week.equal?(NOT_GIVEN)
        _body["startMinute"] = start_minute unless start_minute.equal?(NOT_GIVEN)
        _body["endMinute"] = end_minute unless end_minute.equal?(NOT_GIVEN)
        _body["intervalWeeks"] = interval_weeks unless interval_weeks.equal?(NOT_GIVEN)
        _body["effectiveFrom"] = Serialize.dump(effective_from) unless effective_from.equal?(NOT_GIVEN)
        _body["effectiveTo"] = Serialize.dump(effective_to) unless effective_to.equal?(NOT_GIVEN)
        _body["startDateTime"] = Serialize.dump(start_date_time) unless start_date_time.equal?(NOT_GIVEN)
        _body["endDateTime"] = Serialize.dump(end_date_time) unless end_date_time.equal?(NOT_GIVEN)
        _body["isPreferred"] = is_preferred unless is_preferred.equal?(NOT_GIVEN)
        _body["reason"] = reason unless reason.equal?(NOT_GIVEN)
        _body["isActive"] = is_active unless is_active.equal?(NOT_GIVEN)
        Models::Availability.from_hash(@client.request("POST", "/v1/availability", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve an availability window.
      #
      # Returns one availability window by ID. Available to keys belonging to office staff and
      # caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the availability window.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Availability]
      def retrieve(id, request_options: nil)
        Models::Availability.from_hash(@client.request("GET", "/v1/availability/#{esc(id)}", options: request_options))
      end

      # Update an availability window.
      #
      # Changes the fields you send and returns the updated availability window. Send `null` to
      # clear an optional field. Available to keys belonging to office staff and caregivers. With
      # a caregiver's or patient's key, a saved record that key cannot read back is answered with
      # only `object` and `id`. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the availability window.
      # @param is_available [Boolean, nil] `true` when the caregiver can work in this window,
      #   `false` for time off.
      # @param recurring [Boolean, nil] Whether the window repeats weekly.
      # @param day_of_week [Integer, nil] For weekly windows, the weekday: 0 is Sunday, 6 is
      #   Saturday.
      # @param start_minute [Integer, nil] For weekly windows, the start time in minutes after
      #   midnight.
      # @param end_minute [Integer, nil] For weekly windows, the end time in minutes after
      #   midnight.
      # @param interval_weeks [Integer, nil] For weekly windows, repeat every this many weeks.
      #   Defaults to every week.
      # @param effective_from [String, Time, Date, nil] First date a weekly window applies.
      # @param effective_to [String, Time, Date, nil] Last date a weekly window applies; `null`
      #   for no end.
      # @param start_date_time [String, Time, Date, nil] For one-off windows, when it starts.
      # @param end_date_time [String, Time, Date, nil] For one-off windows, when it ends.
      # @param is_preferred [Boolean, nil] Whether these are the caregiver's preferred hours.
      # @param reason [String, nil] Why the caregiver is unavailable, for time off.
      # @param is_active [Boolean, nil] Whether the window is in effect.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Availability]
      def update(
        id,
        is_available: NOT_GIVEN,
        recurring: NOT_GIVEN,
        day_of_week: NOT_GIVEN,
        start_minute: NOT_GIVEN,
        end_minute: NOT_GIVEN,
        interval_weeks: NOT_GIVEN,
        effective_from: NOT_GIVEN,
        effective_to: NOT_GIVEN,
        start_date_time: NOT_GIVEN,
        end_date_time: NOT_GIVEN,
        is_preferred: NOT_GIVEN,
        reason: NOT_GIVEN,
        is_active: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["isAvailable"] = is_available unless is_available.equal?(NOT_GIVEN)
        _body["recurring"] = recurring unless recurring.equal?(NOT_GIVEN)
        _body["dayOfWeek"] = day_of_week unless day_of_week.equal?(NOT_GIVEN)
        _body["startMinute"] = start_minute unless start_minute.equal?(NOT_GIVEN)
        _body["endMinute"] = end_minute unless end_minute.equal?(NOT_GIVEN)
        _body["intervalWeeks"] = interval_weeks unless interval_weeks.equal?(NOT_GIVEN)
        _body["effectiveFrom"] = Serialize.dump(effective_from) unless effective_from.equal?(NOT_GIVEN)
        _body["effectiveTo"] = Serialize.dump(effective_to) unless effective_to.equal?(NOT_GIVEN)
        _body["startDateTime"] = Serialize.dump(start_date_time) unless start_date_time.equal?(NOT_GIVEN)
        _body["endDateTime"] = Serialize.dump(end_date_time) unless end_date_time.equal?(NOT_GIVEN)
        _body["isPreferred"] = is_preferred unless is_preferred.equal?(NOT_GIVEN)
        _body["reason"] = reason unless reason.equal?(NOT_GIVEN)
        _body["isActive"] = is_active unless is_active.equal?(NOT_GIVEN)
        Models::Availability.from_hash(@client.request("PATCH", "/v1/availability/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete an availability window.
      #
      # Deletes an availability window. Available to keys belonging to office staff and
      # caregivers. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the availability window.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::AvailabilityDeleted]
      def delete(id, request_options: nil)
        Models::AvailabilityDeleted.from_hash(@client.request("DELETE", "/v1/availability/#{esc(id)}", options: request_options))
      end
    end

    # Skills and specialties on a caregiver's profile, such as dementia care or Hoyer lift
    # transfers.
    class Specializations < Resource
      # List specializations.
      #
      # Returns a page of specializations. Filters combine with AND. Use `next_cursor` to fetch
      # the next page. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param caregiver_id [String, nil] Only return specializations of this caregiver.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Specialization>]
      def list(
        caregiver_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["caregiver_id"] = caregiver_id unless caregiver_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/specializations", _query, Models::Specialization, request_options)
      end

      # Create a specialization.
      #
      # Creates a specialization and returns it. Send an `Idempotency-Key` header to make the
      # request safe to retry. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param caregiver_id [String] The caregiver.
      # @param name [String] Name of the skill.
      # @param description [String, nil] Details.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Specialization]
      def create(caregiver_id:, name:, description: NOT_GIVEN, request_options: nil)
        _body = {
          "caregiverId" => caregiver_id,
          "name" => name
        }
        _body["description"] = description unless description.equal?(NOT_GIVEN)
        Models::Specialization.from_hash(@client.request("POST", "/v1/specializations", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a specialization.
      #
      # Returns one specialization by ID. Available to keys belonging to office staff and
      # caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the specialization.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Specialization]
      def retrieve(id, request_options: nil)
        Models::Specialization.from_hash(@client.request("GET", "/v1/specializations/#{esc(id)}", options: request_options))
      end

      # Update a specialization.
      #
      # Changes the fields you send and returns the updated specialization. Send `null` to clear
      # an optional field. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the specialization.
      # @param name [String, nil] Name of the skill.
      # @param description [String, nil] Details.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Specialization]
      def update(id, name: nil, description: NOT_GIVEN, request_options: nil)
        _body = {}
        _body["name"] = name unless name.nil?
        _body["description"] = description unless description.equal?(NOT_GIVEN)
        Models::Specialization.from_hash(@client.request("PATCH", "/v1/specializations/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete a specialization.
      #
      # Deletes a specialization. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the specialization.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::SpecializationDeleted]
      def delete(id, request_options: nil)
        Models::SpecializationDeleted.from_hash(@client.request("DELETE", "/v1/specializations/#{esc(id)}", options: request_options))
      end
    end

    # People who applied to work for your agency, tracked through your hiring stages until they
    # are hired as caregivers.
    class Applicants < Resource
      # List applicants.
      #
      # Returns a page of applicants. Filters combine with AND. Use `next_cursor` to fetch the
      # next page. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param stage [String, nil] Only return applicants in this hiring stage.
      # @param office_id [String, nil] Only return applicants to this office.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Applicant>]
      def list(
        stage: nil,
        office_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["stage"] = stage unless stage.nil?
        _query["office_id"] = office_id unless office_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/applicants", _query, Models::Applicant, request_options)
      end

      # Create an applicant.
      #
      # Creates an applicant and returns it. Send an `Idempotency-Key` header to make the request
      # safe to retry. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param first_name [String] Given name.
      # @param middle_name [String, nil] Middle name.
      # @param last_name [String] Family name.
      # @param email [String, nil] Email address.
      # @param phone [String, nil] Phone number.
      # @param stage [String, nil] Hiring stage, as named in your pipeline.
      # @param application_date [String, Time, Date, nil] When the application was received.
      # @param application_source [String, nil] Where the applicant found you.
      # @param referred_by [String, nil] Who referred the applicant.
      # @param city [String, nil] City.
      # @param state [String, nil] State, as a two-letter code.
      # @param zip_code [String, nil] ZIP code.
      # @param desired_start_date [String, Time, Date, nil] Earliest date the applicant can start.
      # @param desired_pay_rate [Float, nil] Hourly pay the applicant is asking for, in dollars.
      # @param available_hours_per_week [Integer, nil] Hours per week the applicant can work.
      # @param years_experience [Integer, nil] Years of caregiving experience.
      # @param primary_language [String, nil] Primary language.
      # @param has_drivers_license [Boolean, nil] Whether the applicant has a driver's license.
      # @param has_reliable_transportation [Boolean, nil] Whether the applicant has reliable
      #   transportation.
      # @param has_cpr_certification [Boolean, nil] Whether the applicant holds a current CPR
      #   certification.
      # @param interview_date [String, Time, Date, nil] Scheduled or completed interview time.
      # @param offer_status [String, nil] Status of any job offer.
      # @param office_id [String, nil] The office the applicant applied to.
      # @param notes [String, nil] Recruiter notes.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Applicant]
      def create(
        first_name:,
        last_name:,
        middle_name: NOT_GIVEN,
        email: NOT_GIVEN,
        phone: NOT_GIVEN,
        stage: NOT_GIVEN,
        application_date: NOT_GIVEN,
        application_source: NOT_GIVEN,
        referred_by: NOT_GIVEN,
        city: NOT_GIVEN,
        state: NOT_GIVEN,
        zip_code: NOT_GIVEN,
        desired_start_date: NOT_GIVEN,
        desired_pay_rate: NOT_GIVEN,
        available_hours_per_week: NOT_GIVEN,
        years_experience: NOT_GIVEN,
        primary_language: NOT_GIVEN,
        has_drivers_license: NOT_GIVEN,
        has_reliable_transportation: NOT_GIVEN,
        has_cpr_certification: NOT_GIVEN,
        interview_date: NOT_GIVEN,
        offer_status: NOT_GIVEN,
        office_id: NOT_GIVEN,
        notes: NOT_GIVEN,
        request_options: nil
      )
        _body = {
          "firstName" => first_name,
          "lastName" => last_name
        }
        _body["middleName"] = middle_name unless middle_name.equal?(NOT_GIVEN)
        _body["email"] = email unless email.equal?(NOT_GIVEN)
        _body["phone"] = phone unless phone.equal?(NOT_GIVEN)
        _body["stage"] = stage unless stage.equal?(NOT_GIVEN)
        _body["applicationDate"] = Serialize.dump(application_date) unless application_date.equal?(NOT_GIVEN)
        _body["applicationSource"] = application_source unless application_source.equal?(NOT_GIVEN)
        _body["referredBy"] = referred_by unless referred_by.equal?(NOT_GIVEN)
        _body["city"] = city unless city.equal?(NOT_GIVEN)
        _body["state"] = state unless state.equal?(NOT_GIVEN)
        _body["zipCode"] = zip_code unless zip_code.equal?(NOT_GIVEN)
        _body["desiredStartDate"] = Serialize.dump(desired_start_date) unless desired_start_date.equal?(NOT_GIVEN)
        _body["desiredPayRate"] = desired_pay_rate unless desired_pay_rate.equal?(NOT_GIVEN)
        _body["availableHoursPerWeek"] = available_hours_per_week unless available_hours_per_week.equal?(NOT_GIVEN)
        _body["yearsExperience"] = years_experience unless years_experience.equal?(NOT_GIVEN)
        _body["primaryLanguage"] = primary_language unless primary_language.equal?(NOT_GIVEN)
        _body["hasDriversLicense"] = has_drivers_license unless has_drivers_license.equal?(NOT_GIVEN)
        _body["hasReliableTransportation"] = has_reliable_transportation unless has_reliable_transportation.equal?(NOT_GIVEN)
        _body["hasCPRCertification"] = has_cpr_certification unless has_cpr_certification.equal?(NOT_GIVEN)
        _body["interviewDate"] = Serialize.dump(interview_date) unless interview_date.equal?(NOT_GIVEN)
        _body["offerStatus"] = offer_status unless offer_status.equal?(NOT_GIVEN)
        _body["officeId"] = office_id unless office_id.equal?(NOT_GIVEN)
        _body["notes"] = notes unless notes.equal?(NOT_GIVEN)
        Models::Applicant.from_hash(@client.request("POST", "/v1/applicants", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve an applicant.
      #
      # Returns one applicant by ID. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the applicant.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Applicant]
      def retrieve(id, request_options: nil)
        Models::Applicant.from_hash(@client.request("GET", "/v1/applicants/#{esc(id)}", options: request_options))
      end

      # Update an applicant.
      #
      # Changes the fields you send and returns the updated applicant. Send `null` to clear an
      # optional field. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the applicant.
      # @param first_name [String, nil] Given name.
      # @param middle_name [String, nil] Middle name.
      # @param last_name [String, nil] Family name.
      # @param email [String, nil] Email address.
      # @param phone [String, nil] Phone number.
      # @param stage [String, nil] Hiring stage, as named in your pipeline.
      # @param application_date [String, Time, Date, nil] When the application was received.
      # @param application_source [String, nil] Where the applicant found you.
      # @param referred_by [String, nil] Who referred the applicant.
      # @param city [String, nil] City.
      # @param state [String, nil] State, as a two-letter code.
      # @param zip_code [String, nil] ZIP code.
      # @param desired_start_date [String, Time, Date, nil] Earliest date the applicant can start.
      # @param desired_pay_rate [Float, nil] Hourly pay the applicant is asking for, in dollars.
      # @param available_hours_per_week [Integer, nil] Hours per week the applicant can work.
      # @param years_experience [Integer, nil] Years of caregiving experience.
      # @param primary_language [String, nil] Primary language.
      # @param has_drivers_license [Boolean, nil] Whether the applicant has a driver's license.
      # @param has_reliable_transportation [Boolean, nil] Whether the applicant has reliable
      #   transportation.
      # @param has_cpr_certification [Boolean, nil] Whether the applicant holds a current CPR
      #   certification.
      # @param interview_date [String, Time, Date, nil] Scheduled or completed interview time.
      # @param offer_status [String, nil] Status of any job offer.
      # @param office_id [String, nil] The office the applicant applied to.
      # @param notes [String, nil] Recruiter notes.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Applicant]
      def update(
        id,
        first_name: nil,
        middle_name: NOT_GIVEN,
        last_name: nil,
        email: NOT_GIVEN,
        phone: NOT_GIVEN,
        stage: NOT_GIVEN,
        application_date: NOT_GIVEN,
        application_source: NOT_GIVEN,
        referred_by: NOT_GIVEN,
        city: NOT_GIVEN,
        state: NOT_GIVEN,
        zip_code: NOT_GIVEN,
        desired_start_date: NOT_GIVEN,
        desired_pay_rate: NOT_GIVEN,
        available_hours_per_week: NOT_GIVEN,
        years_experience: NOT_GIVEN,
        primary_language: NOT_GIVEN,
        has_drivers_license: NOT_GIVEN,
        has_reliable_transportation: NOT_GIVEN,
        has_cpr_certification: NOT_GIVEN,
        interview_date: NOT_GIVEN,
        offer_status: NOT_GIVEN,
        office_id: NOT_GIVEN,
        notes: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["firstName"] = first_name unless first_name.nil?
        _body["middleName"] = middle_name unless middle_name.equal?(NOT_GIVEN)
        _body["lastName"] = last_name unless last_name.nil?
        _body["email"] = email unless email.equal?(NOT_GIVEN)
        _body["phone"] = phone unless phone.equal?(NOT_GIVEN)
        _body["stage"] = stage unless stage.equal?(NOT_GIVEN)
        _body["applicationDate"] = Serialize.dump(application_date) unless application_date.equal?(NOT_GIVEN)
        _body["applicationSource"] = application_source unless application_source.equal?(NOT_GIVEN)
        _body["referredBy"] = referred_by unless referred_by.equal?(NOT_GIVEN)
        _body["city"] = city unless city.equal?(NOT_GIVEN)
        _body["state"] = state unless state.equal?(NOT_GIVEN)
        _body["zipCode"] = zip_code unless zip_code.equal?(NOT_GIVEN)
        _body["desiredStartDate"] = Serialize.dump(desired_start_date) unless desired_start_date.equal?(NOT_GIVEN)
        _body["desiredPayRate"] = desired_pay_rate unless desired_pay_rate.equal?(NOT_GIVEN)
        _body["availableHoursPerWeek"] = available_hours_per_week unless available_hours_per_week.equal?(NOT_GIVEN)
        _body["yearsExperience"] = years_experience unless years_experience.equal?(NOT_GIVEN)
        _body["primaryLanguage"] = primary_language unless primary_language.equal?(NOT_GIVEN)
        _body["hasDriversLicense"] = has_drivers_license unless has_drivers_license.equal?(NOT_GIVEN)
        _body["hasReliableTransportation"] = has_reliable_transportation unless has_reliable_transportation.equal?(NOT_GIVEN)
        _body["hasCPRCertification"] = has_cpr_certification unless has_cpr_certification.equal?(NOT_GIVEN)
        _body["interviewDate"] = Serialize.dump(interview_date) unless interview_date.equal?(NOT_GIVEN)
        _body["offerStatus"] = offer_status unless offer_status.equal?(NOT_GIVEN)
        _body["officeId"] = office_id unless office_id.equal?(NOT_GIVEN)
        _body["notes"] = notes unless notes.equal?(NOT_GIVEN)
        Models::Applicant.from_hash(@client.request("PATCH", "/v1/applicants/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete an applicant.
      #
      # Deletes an applicant. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the applicant.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::ApplicantDeleted]
      def delete(id, request_options: nil)
        Models::ApplicantDeleted.from_hash(@client.request("DELETE", "/v1/applicants/#{esc(id)}", options: request_options))
      end
    end

    # Visits are scheduled or completed caregiver shifts at a patient's home. A visit's patient,
    # caregiver, times and status are set when it is created; reschedule or reassign a visit in
    # AveeCare.
    class Visits < Resource
      # List visits.
      #
      # Returns a page of visits, ordered by scheduled start, earliest first. Filters combine with
      # AND. Use `next_cursor` to fetch the next page.
      #
      # Requires the +read+ scope.
      #
      # @param start_from [String, Time, Date] Start of the window (inclusive), ISO 8601 with a
      #   time zone. Visits are listed by scheduled start. Both `start_from` and `start_to` are
      #   required, and the window can be at most 93 days.
      # @param start_to [String, Time, Date] End of the window (exclusive), ISO 8601 with a time
      #   zone. At most 93 days after `start_from`.
      # @param patient_id [String, nil] Only return visits for this patient.
      # @param caregiver_id [String, nil] Only return visits assigned to this caregiver.
      # @param status [String, nil] Only return visits with this status.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Visit>]
      def list(
        start_from:,
        start_to:,
        patient_id: nil,
        caregiver_id: nil,
        status: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["start_from"] = start_from
        _query["start_to"] = start_to
        _query["patient_id"] = patient_id unless patient_id.nil?
        _query["caregiver_id"] = caregiver_id unless caregiver_id.nil?
        _query["status"] = status unless status.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/visits", _query, Models::Visit, request_options)
      end

      # Create a visit.
      #
      # Creates a visit and returns it. Send an `Idempotency-Key` header to make the request safe
      # to retry. Available to keys belonging to office staff. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param patient_id [String] The patient being visited.
      # @param caregiver_id [String, nil] The caregiver assigned to the visit; `null` for an open
      #   shift.
      # @param start_time [String, Time, Date] Scheduled start.
      # @param end_time [String, Time, Date] Scheduled end.
      # @param status [String, nil] Where the visit is in its day. New visits are `Scheduled`.
      # @param title [String, nil] Short title shown on the schedule.
      # @param is_all_day [Boolean, nil] Whether the visit spans the whole day, such as a live-in
      #   shift.
      # @param tasks [Array<String>, nil] Tasks the caregiver should complete during the visit.
      # @param reason [String, nil] Why the visit is scheduled, if it is not routine.
      # @param notes [String, nil] Notes for the caregiver about this visit.
      # @param service_code [String, nil] Billing service code for the visit.
      # @param location_address [String, nil] Where the visit takes place, when it is not the
      #   patient's home address.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Visit]
      def create(
        patient_id:,
        start_time:,
        end_time:,
        caregiver_id: NOT_GIVEN,
        status: NOT_GIVEN,
        title: NOT_GIVEN,
        is_all_day: NOT_GIVEN,
        tasks: NOT_GIVEN,
        reason: NOT_GIVEN,
        notes: NOT_GIVEN,
        service_code: NOT_GIVEN,
        location_address: NOT_GIVEN,
        request_options: nil
      )
        _body = {
          "patientId" => patient_id,
          "startTime" => Serialize.dump(start_time),
          "endTime" => Serialize.dump(end_time)
        }
        _body["caregiverId"] = caregiver_id unless caregiver_id.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["title"] = title unless title.equal?(NOT_GIVEN)
        _body["isAllDay"] = is_all_day unless is_all_day.equal?(NOT_GIVEN)
        _body["tasks"] = Serialize.dump(tasks) unless tasks.equal?(NOT_GIVEN)
        _body["reason"] = reason unless reason.equal?(NOT_GIVEN)
        _body["notes"] = notes unless notes.equal?(NOT_GIVEN)
        _body["serviceCode"] = service_code unless service_code.equal?(NOT_GIVEN)
        _body["locationAddress"] = location_address unless location_address.equal?(NOT_GIVEN)
        Models::Visit.from_hash(@client.request("POST", "/v1/visits", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a visit.
      #
      # Returns one visit by ID.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the visit.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Visit]
      def retrieve(id, request_options: nil)
        Models::Visit.from_hash(@client.request("GET", "/v1/visits/#{esc(id)}", options: request_options))
      end

      # Update a visit.
      #
      # Changes the fields you send and returns the updated visit. Send `null` to clear an
      # optional field. Available to keys belonging to office staff and caregivers. With a
      # caregiver's or patient's key, a saved record that key cannot read back is answered with
      # only `object` and `id`. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the visit.
      # @param title [String, nil] Short title shown on the schedule.
      # @param is_all_day [Boolean, nil] Whether the visit spans the whole day, such as a live-in
      #   shift.
      # @param tasks [Array<String>, nil] Tasks the caregiver should complete during the visit.
      # @param reason [String, nil] Why the visit is scheduled, if it is not routine.
      # @param notes [String, nil] Notes for the caregiver about this visit.
      # @param service_code [String, nil] Billing service code for the visit.
      # @param location_address [String, nil] Where the visit takes place, when it is not the
      #   patient's home address.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Visit]
      def update(
        id,
        title: NOT_GIVEN,
        is_all_day: NOT_GIVEN,
        tasks: NOT_GIVEN,
        reason: NOT_GIVEN,
        notes: NOT_GIVEN,
        service_code: NOT_GIVEN,
        location_address: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["title"] = title unless title.equal?(NOT_GIVEN)
        _body["isAllDay"] = is_all_day unless is_all_day.equal?(NOT_GIVEN)
        _body["tasks"] = Serialize.dump(tasks) unless tasks.equal?(NOT_GIVEN)
        _body["reason"] = reason unless reason.equal?(NOT_GIVEN)
        _body["notes"] = notes unless notes.equal?(NOT_GIVEN)
        _body["serviceCode"] = service_code unless service_code.equal?(NOT_GIVEN)
        _body["locationAddress"] = location_address unless location_address.equal?(NOT_GIVEN)
        Models::Visit.from_hash(@client.request("PATCH", "/v1/visits/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete a visit.
      #
      # Deletes a visit. The visit moves to the schedule's recycle bin in AveeCare, where staff
      # can restore it. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the visit.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::VisitDeleted]
      def delete(id, request_options: nil)
        Models::VisitDeleted.from_hash(@client.request("DELETE", "/v1/visits/#{esc(id)}", options: request_options))
      end
    end

    # Notes written about a visit by the caregiver or office staff.
    class VisitNotes < Resource
      # List visit notes.
      #
      # Returns a page of visit notes. Filters combine with AND. Use `next_cursor` to fetch the
      # next page. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param visit_id [String, nil] Only return notes about this visit.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::VisitNote>]
      def list(
        visit_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["visit_id"] = visit_id unless visit_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/visit-notes", _query, Models::VisitNote, request_options)
      end

      # Create a visit note.
      #
      # Creates a visit note and returns it. Send an `Idempotency-Key` header to make the request
      # safe to retry. Available to keys belonging to office staff and caregivers. With a
      # caregiver's or patient's key, a saved record that key cannot read back is answered with
      # only `object` and `id`. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param visit_id [String] The visit the note is about.
      # @param content [String] The note.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::VisitNote]
      def create(visit_id:, content:, request_options: nil)
        _body = {
          "visitId" => visit_id,
          "content" => content
        }
        Models::VisitNote.from_hash(@client.request("POST", "/v1/visit-notes", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a visit note.
      #
      # Returns one visit note by ID. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the visit note.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::VisitNote]
      def retrieve(id, request_options: nil)
        Models::VisitNote.from_hash(@client.request("GET", "/v1/visit-notes/#{esc(id)}", options: request_options))
      end

      # Update a visit note.
      #
      # Changes the fields you send and returns the updated visit note. Send `null` to clear an
      # optional field. Available to keys belonging to office staff and caregivers. With a
      # caregiver's or patient's key, a saved record that key cannot read back is answered with
      # only `object` and `id`. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the visit note.
      # @param content [String, nil] The note.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::VisitNote]
      def update(id, content: nil, request_options: nil)
        _body = {}
        _body["content"] = content unless content.nil?
        Models::VisitNote.from_hash(@client.request("PATCH", "/v1/visit-notes/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete a visit note.
      #
      # Deletes a visit note. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the visit note.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::VisitNoteDeleted]
      def delete(id, request_options: nil)
        Models::VisitNoteDeleted.from_hash(@client.request("DELETE", "/v1/visit-notes/#{esc(id)}", options: request_options))
      end
    end

    # Requests from caregivers to pick up visits with a patient, which office staff approve or
    # deny.
    class VisitRequests < Resource
      # List visit requests.
      #
      # Returns a page of visit requests. Filters combine with AND. Use `next_cursor` to fetch the
      # next page. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param caregiver_id [String, nil] Only return requests from this caregiver.
      # @param status [String, nil] Only return requests with this status.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::VisitRequest>]
      def list(
        caregiver_id: nil,
        status: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["caregiver_id"] = caregiver_id unless caregiver_id.nil?
        _query["status"] = status unless status.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/visit-requests", _query, Models::VisitRequest, request_options)
      end

      # Create a visit request.
      #
      # Creates a visit request and returns it. Send an `Idempotency-Key` header to make the
      # request safe to retry. Available to keys belonging to office staff and caregivers. With a
      # caregiver's or patient's key, a saved record that key cannot read back is answered with
      # only `object` and `id`. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param caregiver_id [String, nil] The caregiver asking for the visit. With a caregiver's
      #   API key this is always that caregiver (leave it out); office staff must send it.
      # @param patient_id [String, nil] The patient the caregiver would visit.
      # @param patient_name [String, nil] Patient's display name.
      # @param preferred_start_date [String, Time, Date, nil] First date the caregiver could
      #   start.
      # @param preferred_end_date [String, Time, Date, nil] Last date of the request.
      # @param preferred_time_of_day [String, nil] Time of day the caregiver prefers.
      # @param reason [String, nil] Why the caregiver is asking.
      # @param status [String, nil] Where the request stands. A caregiver's key creates `Pending`
      #   requests and can only change its own pending request to `Cancelled`; approving and denying
      #   is for office staff.
      # @param admin_response [String, nil] The office's reply. Set by office staff.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::VisitRequest]
      def create(
        caregiver_id: NOT_GIVEN,
        patient_id: NOT_GIVEN,
        patient_name: NOT_GIVEN,
        preferred_start_date: NOT_GIVEN,
        preferred_end_date: NOT_GIVEN,
        preferred_time_of_day: NOT_GIVEN,
        reason: NOT_GIVEN,
        status: NOT_GIVEN,
        admin_response: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["caregiverId"] = caregiver_id unless caregiver_id.equal?(NOT_GIVEN)
        _body["patientId"] = patient_id unless patient_id.equal?(NOT_GIVEN)
        _body["patientName"] = patient_name unless patient_name.equal?(NOT_GIVEN)
        _body["preferredStartDate"] = Serialize.dump(preferred_start_date) unless preferred_start_date.equal?(NOT_GIVEN)
        _body["preferredEndDate"] = Serialize.dump(preferred_end_date) unless preferred_end_date.equal?(NOT_GIVEN)
        _body["preferredTimeOfDay"] = preferred_time_of_day unless preferred_time_of_day.equal?(NOT_GIVEN)
        _body["reason"] = reason unless reason.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["adminResponse"] = admin_response unless admin_response.equal?(NOT_GIVEN)
        Models::VisitRequest.from_hash(@client.request("POST", "/v1/visit-requests", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a visit request.
      #
      # Returns one visit request by ID. Available to keys belonging to office staff and
      # caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the visit request.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::VisitRequest]
      def retrieve(id, request_options: nil)
        Models::VisitRequest.from_hash(@client.request("GET", "/v1/visit-requests/#{esc(id)}", options: request_options))
      end

      # Update a visit request.
      #
      # Changes the fields you send and returns the updated visit request. Send `null` to clear an
      # optional field. Available to keys belonging to office staff and caregivers. With a
      # caregiver's or patient's key, a saved record that key cannot read back is answered with
      # only `object` and `id`. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the visit request.
      # @param patient_id [String, nil] The patient the caregiver would visit.
      # @param patient_name [String, nil] Patient's display name.
      # @param preferred_start_date [String, Time, Date, nil] First date the caregiver could
      #   start.
      # @param preferred_end_date [String, Time, Date, nil] Last date of the request.
      # @param preferred_time_of_day [String, nil] Time of day the caregiver prefers.
      # @param reason [String, nil] Why the caregiver is asking.
      # @param status [String, nil] Where the request stands. A caregiver's key creates `Pending`
      #   requests and can only change its own pending request to `Cancelled`; approving and denying
      #   is for office staff.
      # @param admin_response [String, nil] The office's reply. Set by office staff.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::VisitRequest]
      def update(
        id,
        patient_id: NOT_GIVEN,
        patient_name: NOT_GIVEN,
        preferred_start_date: NOT_GIVEN,
        preferred_end_date: NOT_GIVEN,
        preferred_time_of_day: NOT_GIVEN,
        reason: NOT_GIVEN,
        status: NOT_GIVEN,
        admin_response: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["patientId"] = patient_id unless patient_id.equal?(NOT_GIVEN)
        _body["patientName"] = patient_name unless patient_name.equal?(NOT_GIVEN)
        _body["preferredStartDate"] = Serialize.dump(preferred_start_date) unless preferred_start_date.equal?(NOT_GIVEN)
        _body["preferredEndDate"] = Serialize.dump(preferred_end_date) unless preferred_end_date.equal?(NOT_GIVEN)
        _body["preferredTimeOfDay"] = preferred_time_of_day unless preferred_time_of_day.equal?(NOT_GIVEN)
        _body["reason"] = reason unless reason.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["adminResponse"] = admin_response unless admin_response.equal?(NOT_GIVEN)
        Models::VisitRequest.from_hash(@client.request("PATCH", "/v1/visit-requests/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete a visit request.
      #
      # Deletes a visit request. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the visit request.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::VisitRequestDeleted]
      def delete(id, request_options: nil)
        Models::VisitRequestDeleted.from_hash(@client.request("DELETE", "/v1/visit-requests/#{esc(id)}", options: request_options))
      end
    end

    # Open shifts are unassigned visits offered to caregivers so one of them can claim it.
    class OpenShifts < Resource
      # List open shifts.
      #
      # Returns a page of open shifts. Filters combine with AND. Use `next_cursor` to fetch the
      # next page. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param status [String, nil] Only return offers with this status.
      # @param visit_id [String, nil] Only return offers for this visit.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::OpenShift>]
      def list(
        status: nil,
        visit_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["status"] = status unless status.nil?
        _query["visit_id"] = visit_id unless visit_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/open-shifts", _query, Models::OpenShift, request_options)
      end

      # Create an open shift.
      #
      # Creates an open shift and returns it. Send an `Idempotency-Key` header to make the request
      # safe to retry. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param visit_id [String] The unassigned visit being offered.
      # @param broadcast_date [String, Time, Date, nil] When the shift was offered.
      # @param status [String, nil] Whether the offer is still open.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::OpenShift]
      def create(visit_id:, broadcast_date: NOT_GIVEN, status: NOT_GIVEN, request_options: nil)
        _body = {
          "visitId" => visit_id
        }
        _body["broadcastDate"] = Serialize.dump(broadcast_date) unless broadcast_date.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        Models::OpenShift.from_hash(@client.request("POST", "/v1/open-shifts", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve an open shift.
      #
      # Returns one open shift by ID. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the open shift.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::OpenShift]
      def retrieve(id, request_options: nil)
        Models::OpenShift.from_hash(@client.request("GET", "/v1/open-shifts/#{esc(id)}", options: request_options))
      end

      # Update an open shift.
      #
      # Changes the fields you send and returns the updated open shift. Send `null` to clear an
      # optional field. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the open shift.
      # @param broadcast_date [String, Time, Date, nil] When the shift was offered.
      # @param status [String, nil] Whether the offer is still open.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::OpenShift]
      def update(id, broadcast_date: NOT_GIVEN, status: NOT_GIVEN, request_options: nil)
        _body = {}
        _body["broadcastDate"] = Serialize.dump(broadcast_date) unless broadcast_date.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        Models::OpenShift.from_hash(@client.request("PATCH", "/v1/open-shifts/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete an open shift.
      #
      # Deletes an open shift. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the open shift.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::OpenShiftDeleted]
      def delete(id, request_options: nil)
        Models::OpenShiftDeleted.from_hash(@client.request("DELETE", "/v1/open-shifts/#{esc(id)}", options: request_options))
      end
    end

    # Requests from one caregiver to hand a visit to another, which the other caregiver and then
    # the office approve.
    class ShiftSwaps < Resource
      # List shift swaps.
      #
      # Returns a page of shift swaps. Filters combine with AND. Use `next_cursor` to fetch the
      # next page. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param status [String, nil] Only return swaps with this status.
      # @param visit_id [String, nil] Only return swaps for this visit.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::ShiftSwap>]
      def list(
        status: nil,
        visit_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["status"] = status unless status.nil?
        _query["visit_id"] = visit_id unless visit_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/shift-swaps", _query, Models::ShiftSwap, request_options)
      end

      # Create a shift swap.
      #
      # Creates a shift swap and returns it. Send an `Idempotency-Key` header to make the request
      # safe to retry. Available to keys belonging to office staff and caregivers. With a
      # caregiver's or patient's key, a saved record that key cannot read back is answered with
      # only `object` and `id`. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param visit_id [String] The visit to hand over.
      # @param requesting_caregiver_id [String, nil] The caregiver giving up the visit. With a
      #   caregiver's API key this is always that caregiver (leave it out), and the visit must be
      #   assigned to them; office staff must send it.
      # @param target_caregiver_id [String, nil] The caregiver asked to take the visit.
      # @param target_caregiver_name [String, nil] Display name of the target caregiver.
      # @param reason [String, nil] Why the swap is requested.
      # @param status [String, nil] Where the swap stands. With a caregiver's key: new swaps are
      #   `Pending`; the asked caregiver changes a `Pending` swap to `Accepted` or `Declined`; the
      #   requesting caregiver can change it to `Cancelled`. `AdminApproved` and `AdminDenied` are
      #   for office staff.
      # @param request_date [String, Time, Date, nil] When the swap was requested.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::ShiftSwap]
      def create(
        visit_id:,
        requesting_caregiver_id: NOT_GIVEN,
        target_caregiver_id: NOT_GIVEN,
        target_caregiver_name: NOT_GIVEN,
        reason: NOT_GIVEN,
        status: NOT_GIVEN,
        request_date: NOT_GIVEN,
        request_options: nil
      )
        _body = {
          "visitId" => visit_id
        }
        _body["requestingCaregiverId"] = requesting_caregiver_id unless requesting_caregiver_id.equal?(NOT_GIVEN)
        _body["targetCaregiverId"] = target_caregiver_id unless target_caregiver_id.equal?(NOT_GIVEN)
        _body["targetCaregiverName"] = target_caregiver_name unless target_caregiver_name.equal?(NOT_GIVEN)
        _body["reason"] = reason unless reason.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["requestDate"] = Serialize.dump(request_date) unless request_date.equal?(NOT_GIVEN)
        Models::ShiftSwap.from_hash(@client.request("POST", "/v1/shift-swaps", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a shift swap.
      #
      # Returns one shift swap by ID. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the shift swap.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::ShiftSwap]
      def retrieve(id, request_options: nil)
        Models::ShiftSwap.from_hash(@client.request("GET", "/v1/shift-swaps/#{esc(id)}", options: request_options))
      end

      # Update a shift swap.
      #
      # Changes the fields you send and returns the updated shift swap. Send `null` to clear an
      # optional field. Available to keys belonging to office staff and caregivers. With a
      # caregiver's or patient's key, a saved record that key cannot read back is answered with
      # only `object` and `id`. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the shift swap.
      # @param target_caregiver_id [String, nil] The caregiver asked to take the visit.
      # @param target_caregiver_name [String, nil] Display name of the target caregiver.
      # @param reason [String, nil] Why the swap is requested.
      # @param status [String, nil] Where the swap stands. With a caregiver's key: new swaps are
      #   `Pending`; the asked caregiver changes a `Pending` swap to `Accepted` or `Declined`; the
      #   requesting caregiver can change it to `Cancelled`. `AdminApproved` and `AdminDenied` are
      #   for office staff.
      # @param request_date [String, Time, Date, nil] When the swap was requested.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::ShiftSwap]
      def update(
        id,
        target_caregiver_id: NOT_GIVEN,
        target_caregiver_name: NOT_GIVEN,
        reason: NOT_GIVEN,
        status: NOT_GIVEN,
        request_date: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["targetCaregiverId"] = target_caregiver_id unless target_caregiver_id.equal?(NOT_GIVEN)
        _body["targetCaregiverName"] = target_caregiver_name unless target_caregiver_name.equal?(NOT_GIVEN)
        _body["reason"] = reason unless reason.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["requestDate"] = Serialize.dump(request_date) unless request_date.equal?(NOT_GIVEN)
        Models::ShiftSwap.from_hash(@client.request("PATCH", "/v1/shift-swaps/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete a shift swap.
      #
      # Deletes a shift swap. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the shift swap.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::ShiftSwapDeleted]
      def delete(id, request_options: nil)
        Models::ShiftSwapDeleted.from_hash(@client.request("DELETE", "/v1/shift-swaps/#{esc(id)}", options: request_options))
      end
    end

    # Care plans describe the services a patient receives, how often, and when the plan is next
    # reviewed. The plan's goals and task lists are managed in AveeCare and are not included here.
    class CarePlans < Resource
      # List care plans.
      #
      # Returns a page of care plans. Filters combine with AND. Use `next_cursor` to fetch the
      # next page. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param patient_id [String, nil] Only return plans for this patient.
      # @param status [String, nil] Only return plans with this status.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::CarePlan>]
      def list(
        patient_id: nil,
        status: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["patient_id"] = patient_id unless patient_id.nil?
        _query["status"] = status unless status.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/care-plans", _query, Models::CarePlan, request_options)
      end

      # Create a care plan.
      #
      # Creates a care plan and returns it. Send an `Idempotency-Key` header to make the request
      # safe to retry. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param patient_id [String] The patient the plan is for.
      # @param title [String] Plan title.
      # @param status [String, nil] Where the plan is in its lifecycle.
      # @param service_type [String, nil] Type of service the plan covers.
      # @param frequency [String, nil] How often visits happen under the plan.
      # @param start_date [String, Time, Date, nil] Date the plan takes effect.
      # @param end_date [String, Time, Date, nil] Date the plan ends; `null` if open-ended.
      # @param review_date [String, Time, Date, nil] Date the plan is next due for review.
      # @param review_interval_days [Integer, nil] Days between reviews.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::CarePlan]
      def create(
        patient_id:,
        title:,
        status: NOT_GIVEN,
        service_type: NOT_GIVEN,
        frequency: NOT_GIVEN,
        start_date: NOT_GIVEN,
        end_date: NOT_GIVEN,
        review_date: NOT_GIVEN,
        review_interval_days: NOT_GIVEN,
        request_options: nil
      )
        _body = {
          "patientId" => patient_id,
          "title" => title
        }
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["serviceType"] = service_type unless service_type.equal?(NOT_GIVEN)
        _body["frequency"] = frequency unless frequency.equal?(NOT_GIVEN)
        _body["startDate"] = Serialize.dump(start_date) unless start_date.equal?(NOT_GIVEN)
        _body["endDate"] = Serialize.dump(end_date) unless end_date.equal?(NOT_GIVEN)
        _body["reviewDate"] = Serialize.dump(review_date) unless review_date.equal?(NOT_GIVEN)
        _body["reviewIntervalDays"] = review_interval_days unless review_interval_days.equal?(NOT_GIVEN)
        Models::CarePlan.from_hash(@client.request("POST", "/v1/care-plans", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a care plan.
      #
      # Returns one care plan by ID. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the care plan.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::CarePlan]
      def retrieve(id, request_options: nil)
        Models::CarePlan.from_hash(@client.request("GET", "/v1/care-plans/#{esc(id)}", options: request_options))
      end

      # Update a care plan.
      #
      # Changes the fields you send and returns the updated care plan. Send `null` to clear an
      # optional field. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the care plan.
      # @param title [String, nil] Plan title.
      # @param status [String, nil] Where the plan is in its lifecycle.
      # @param service_type [String, nil] Type of service the plan covers.
      # @param frequency [String, nil] How often visits happen under the plan.
      # @param start_date [String, Time, Date, nil] Date the plan takes effect.
      # @param end_date [String, Time, Date, nil] Date the plan ends; `null` if open-ended.
      # @param review_date [String, Time, Date, nil] Date the plan is next due for review.
      # @param review_interval_days [Integer, nil] Days between reviews.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::CarePlan]
      def update(
        id,
        title: nil,
        status: NOT_GIVEN,
        service_type: NOT_GIVEN,
        frequency: NOT_GIVEN,
        start_date: NOT_GIVEN,
        end_date: NOT_GIVEN,
        review_date: NOT_GIVEN,
        review_interval_days: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["title"] = title unless title.nil?
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["serviceType"] = service_type unless service_type.equal?(NOT_GIVEN)
        _body["frequency"] = frequency unless frequency.equal?(NOT_GIVEN)
        _body["startDate"] = Serialize.dump(start_date) unless start_date.equal?(NOT_GIVEN)
        _body["endDate"] = Serialize.dump(end_date) unless end_date.equal?(NOT_GIVEN)
        _body["reviewDate"] = Serialize.dump(review_date) unless review_date.equal?(NOT_GIVEN)
        _body["reviewIntervalDays"] = review_interval_days unless review_interval_days.equal?(NOT_GIVEN)
        Models::CarePlan.from_hash(@client.request("PATCH", "/v1/care-plans/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete a care plan.
      #
      # Deletes a care plan. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the care plan.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::CarePlanDeleted]
      def delete(id, request_options: nil)
        Models::CarePlanDeleted.from_hash(@client.request("DELETE", "/v1/care-plans/#{esc(id)}", options: request_options))
      end
    end

    # Progress notes are the clinical summaries caregivers write after a visit.
    class ProgressNotes < Resource
      # List progress notes.
      #
      # Returns a page of progress notes. Filters combine with AND. Use `next_cursor` to fetch the
      # next page. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param patient_id [String, nil] Only return notes for this patient.
      # @param visit_id [String, nil] Only return notes for this visit.
      # @param caregiver_id [String, nil] Only return notes by this caregiver.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::ProgressNote>]
      def list(
        patient_id: nil,
        visit_id: nil,
        caregiver_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["patient_id"] = patient_id unless patient_id.nil?
        _query["visit_id"] = visit_id unless visit_id.nil?
        _query["caregiver_id"] = caregiver_id unless caregiver_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/progress-notes", _query, Models::ProgressNote, request_options)
      end

      # Create a progress note.
      #
      # Creates a progress note and returns it. Send an `Idempotency-Key` header to make the
      # request safe to retry. Available to keys belonging to office staff and caregivers. With a
      # caregiver's or patient's key, a saved record that key cannot read back is answered with
      # only `object` and `id`. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param visit_id [String] The visit the note documents.
      # @param patient_id [String] The patient.
      # @param caregiver_id [String, nil] The caregiver who wrote the note. With a caregiver's API
      #   key this is always that caregiver (leave it out), and the visit must be assigned to them.
      # @param summary [String] The written summary of the visit.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::ProgressNote]
      def create(visit_id:, patient_id:, summary:, caregiver_id: NOT_GIVEN, request_options: nil)
        _body = {
          "visitId" => visit_id,
          "patientId" => patient_id,
          "summary" => summary
        }
        _body["caregiverId"] = caregiver_id unless caregiver_id.equal?(NOT_GIVEN)
        Models::ProgressNote.from_hash(@client.request("POST", "/v1/progress-notes", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a progress note.
      #
      # Returns one progress note by ID. Available to keys belonging to office staff and
      # caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the progress note.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::ProgressNote]
      def retrieve(id, request_options: nil)
        Models::ProgressNote.from_hash(@client.request("GET", "/v1/progress-notes/#{esc(id)}", options: request_options))
      end

      # Update a progress note.
      #
      # Changes the fields you send and returns the updated progress note. Send `null` to clear an
      # optional field. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the progress note.
      # @param summary [String, nil] The written summary of the visit.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::ProgressNote]
      def update(id, summary: nil, request_options: nil)
        _body = {}
        _body["summary"] = summary unless summary.nil?
        Models::ProgressNote.from_hash(@client.request("PATCH", "/v1/progress-notes/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete a progress note.
      #
      # Deletes a progress note. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the progress note.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::ProgressNoteDeleted]
      def delete(id, request_options: nil)
        Models::ProgressNoteDeleted.from_hash(@client.request("DELETE", "/v1/progress-notes/#{esc(id)}", options: request_options))
      end
    end

    # Payer authorizations: how many units of a service a payer has approved for a patient, and
    # over what dates.
    class Authorizations < Resource
      # List authorizations.
      #
      # Returns a page of authorizations. Filters combine with AND. Use `next_cursor` to fetch the
      # next page. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param patient_id [String, nil] Only return authorizations for this patient.
      # @param status [String, nil] Only return authorizations with this status.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Authorization>]
      def list(
        patient_id: nil,
        status: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["patient_id"] = patient_id unless patient_id.nil?
        _query["status"] = status unless status.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/authorizations", _query, Models::Authorization, request_options)
      end

      # Create an authorization.
      #
      # Creates an authorization and returns it. Send an `Idempotency-Key` header to make the
      # request safe to retry. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param patient_id [String] The patient the authorization covers.
      # @param payer_name [String, nil] The payer that issued it.
      # @param authorization_number [String, nil] The payer's authorization number.
      # @param service_type [String, nil] Service authorized.
      # @param procedure_code [String, nil] Procedure (HCPCS) code billed against it.
      # @param modifiers [String, nil] Procedure code modifiers, comma separated.
      # @param start_date [String, Time, Date, nil] First date the authorization covers.
      # @param end_date [String, Time, Date, nil] Last date the authorization covers.
      # @param authorized_units [Integer, nil] Units approved.
      # @param unit_type [String, nil] What a unit is, in the payer's words.
      # @param unit_basis [String, nil] Whether units count time, visits or days.
      # @param minutes_per_unit [Integer, nil] For time-based units, minutes in one unit.
      # @param frequency [String, nil] Frequency the payer approved.
      # @param place_of_service [String, nil] Place-of-service code.
      # @param status [String, nil] Whether the authorization is in effect.
      # @param notes [String, nil] Notes.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Authorization]
      def create(
        patient_id:,
        payer_name: NOT_GIVEN,
        authorization_number: NOT_GIVEN,
        service_type: NOT_GIVEN,
        procedure_code: NOT_GIVEN,
        modifiers: NOT_GIVEN,
        start_date: NOT_GIVEN,
        end_date: NOT_GIVEN,
        authorized_units: NOT_GIVEN,
        unit_type: NOT_GIVEN,
        unit_basis: NOT_GIVEN,
        minutes_per_unit: NOT_GIVEN,
        frequency: NOT_GIVEN,
        place_of_service: NOT_GIVEN,
        status: NOT_GIVEN,
        notes: NOT_GIVEN,
        request_options: nil
      )
        _body = {
          "patientId" => patient_id
        }
        _body["payerName"] = payer_name unless payer_name.equal?(NOT_GIVEN)
        _body["authorizationNumber"] = authorization_number unless authorization_number.equal?(NOT_GIVEN)
        _body["serviceType"] = service_type unless service_type.equal?(NOT_GIVEN)
        _body["procedureCode"] = procedure_code unless procedure_code.equal?(NOT_GIVEN)
        _body["modifiers"] = modifiers unless modifiers.equal?(NOT_GIVEN)
        _body["startDate"] = Serialize.dump(start_date) unless start_date.equal?(NOT_GIVEN)
        _body["endDate"] = Serialize.dump(end_date) unless end_date.equal?(NOT_GIVEN)
        _body["authorizedUnits"] = authorized_units unless authorized_units.equal?(NOT_GIVEN)
        _body["unitType"] = unit_type unless unit_type.equal?(NOT_GIVEN)
        _body["unitBasis"] = unit_basis unless unit_basis.equal?(NOT_GIVEN)
        _body["minutesPerUnit"] = minutes_per_unit unless minutes_per_unit.equal?(NOT_GIVEN)
        _body["frequency"] = frequency unless frequency.equal?(NOT_GIVEN)
        _body["placeOfService"] = place_of_service unless place_of_service.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["notes"] = notes unless notes.equal?(NOT_GIVEN)
        Models::Authorization.from_hash(@client.request("POST", "/v1/authorizations", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve an authorization.
      #
      # Returns one authorization by ID. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the authorization.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Authorization]
      def retrieve(id, request_options: nil)
        Models::Authorization.from_hash(@client.request("GET", "/v1/authorizations/#{esc(id)}", options: request_options))
      end

      # Update an authorization.
      #
      # Changes the fields you send and returns the updated authorization. Send `null` to clear an
      # optional field. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the authorization.
      # @param payer_name [String, nil] The payer that issued it.
      # @param authorization_number [String, nil] The payer's authorization number.
      # @param service_type [String, nil] Service authorized.
      # @param procedure_code [String, nil] Procedure (HCPCS) code billed against it.
      # @param modifiers [String, nil] Procedure code modifiers, comma separated.
      # @param start_date [String, Time, Date, nil] First date the authorization covers.
      # @param end_date [String, Time, Date, nil] Last date the authorization covers.
      # @param authorized_units [Integer, nil] Units approved.
      # @param unit_type [String, nil] What a unit is, in the payer's words.
      # @param unit_basis [String, nil] Whether units count time, visits or days.
      # @param minutes_per_unit [Integer, nil] For time-based units, minutes in one unit.
      # @param frequency [String, nil] Frequency the payer approved.
      # @param place_of_service [String, nil] Place-of-service code.
      # @param status [String, nil] Whether the authorization is in effect.
      # @param notes [String, nil] Notes.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Authorization]
      def update(
        id,
        payer_name: NOT_GIVEN,
        authorization_number: NOT_GIVEN,
        service_type: NOT_GIVEN,
        procedure_code: NOT_GIVEN,
        modifiers: NOT_GIVEN,
        start_date: NOT_GIVEN,
        end_date: NOT_GIVEN,
        authorized_units: NOT_GIVEN,
        unit_type: NOT_GIVEN,
        unit_basis: NOT_GIVEN,
        minutes_per_unit: NOT_GIVEN,
        frequency: NOT_GIVEN,
        place_of_service: NOT_GIVEN,
        status: NOT_GIVEN,
        notes: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["payerName"] = payer_name unless payer_name.equal?(NOT_GIVEN)
        _body["authorizationNumber"] = authorization_number unless authorization_number.equal?(NOT_GIVEN)
        _body["serviceType"] = service_type unless service_type.equal?(NOT_GIVEN)
        _body["procedureCode"] = procedure_code unless procedure_code.equal?(NOT_GIVEN)
        _body["modifiers"] = modifiers unless modifiers.equal?(NOT_GIVEN)
        _body["startDate"] = Serialize.dump(start_date) unless start_date.equal?(NOT_GIVEN)
        _body["endDate"] = Serialize.dump(end_date) unless end_date.equal?(NOT_GIVEN)
        _body["authorizedUnits"] = authorized_units unless authorized_units.equal?(NOT_GIVEN)
        _body["unitType"] = unit_type unless unit_type.equal?(NOT_GIVEN)
        _body["unitBasis"] = unit_basis unless unit_basis.equal?(NOT_GIVEN)
        _body["minutesPerUnit"] = minutes_per_unit unless minutes_per_unit.equal?(NOT_GIVEN)
        _body["frequency"] = frequency unless frequency.equal?(NOT_GIVEN)
        _body["placeOfService"] = place_of_service unless place_of_service.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["notes"] = notes unless notes.equal?(NOT_GIVEN)
        Models::Authorization.from_hash(@client.request("PATCH", "/v1/authorizations/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete an authorization.
      #
      # Deletes an authorization. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the authorization.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::AuthorizationDeleted]
      def delete(id, request_options: nil)
        Models::AuthorizationDeleted.from_hash(@client.request("DELETE", "/v1/authorizations/#{esc(id)}", options: request_options))
      end
    end

    # Incident reports: falls, injuries, medication errors and other events that need follow-up,
    # often for regulatory reporting.
    class Incidents < Resource
      # List incidents.
      #
      # Returns a page of incidents. Filters combine with AND. Use `next_cursor` to fetch the next
      # page. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param status [String, nil] Only return incidents with this follow-up status.
      # @param patient_id [String, nil] Only return incidents involving this patient.
      # @param caregiver_id [String, nil] Only return incidents involving this caregiver.
      # @param resolved [Boolean, nil] Only return resolved (`true`) or unresolved (`false`)
      #   incidents.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Incident>]
      def list(
        status: nil,
        patient_id: nil,
        caregiver_id: nil,
        resolved: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["status"] = status unless status.nil?
        _query["patient_id"] = patient_id unless patient_id.nil?
        _query["caregiver_id"] = caregiver_id unless caregiver_id.nil?
        _query["resolved"] = resolved unless resolved.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/incidents", _query, Models::Incident, request_options)
      end

      # Create an incident.
      #
      # Creates an incident and returns it. Send an `Idempotency-Key` header to make the request
      # safe to retry. Available to keys belonging to office staff and caregivers. With a
      # caregiver's or patient's key, a saved record that key cannot read back is answered with
      # only `object` and `id`. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param title [String] Short summary.
      # @param description [String, nil] What happened.
      # @param incident_date_time [String, Time, Date, nil] When the incident happened.
      # @param category [String, nil] Kind of incident.
      # @param severity [String, nil] How serious it was.
      # @param status [String, nil] Where follow-up stands. New incidents start `Open`. Only keys
      #   belonging to office staff can set this.
      # @param patient_id [String, nil] The patient involved.
      # @param caregiver_id [String, nil] The caregiver involved.
      # @param visit_id [String, nil] The visit during which it happened.
      # @param actions_taken [String, nil] What was done at the time.
      # @param injury_body_part [String, nil] Body part injured, if any.
      # @param witness_name [String, nil] Witness, if any.
      # @param emergency_services_contacted [Boolean, nil] Whether 911 or other emergency services
      #   were called.
      # @param hospital_transport [Boolean, nil] Whether the patient went to hospital.
      # @param hospital_name [String, nil] Hospital, if transported.
      # @param physician_notified [Boolean, nil] Whether the patient's physician was told.
      # @param family_notified [Boolean, nil] Whether family was told.
      # @param regulatory_report_required [Boolean, nil] Whether the incident must be reported to
      #   a regulator.
      # @param follow_up_required [Boolean, nil] Whether follow-up is needed.
      # @param follow_up_due_at [String, Time, Date, nil] When follow-up is due. Only keys
      #   belonging to office staff can set this.
      # @param follow_up_notes [String, nil] Follow-up notes.
      # @param resolved [Boolean, nil] Whether the incident is resolved. Only keys belonging to
      #   office staff can set this.
      # @param resolution_notes [String, nil] How it was resolved. Only keys belonging to office
      #   staff can set this.
      # @param is_confidential [Boolean, nil] Whether only administrators can see it. Only keys
      #   belonging to office staff can set this.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Incident]
      def create(
        title:,
        description: NOT_GIVEN,
        incident_date_time: NOT_GIVEN,
        category: NOT_GIVEN,
        severity: NOT_GIVEN,
        status: NOT_GIVEN,
        patient_id: NOT_GIVEN,
        caregiver_id: NOT_GIVEN,
        visit_id: NOT_GIVEN,
        actions_taken: NOT_GIVEN,
        injury_body_part: NOT_GIVEN,
        witness_name: NOT_GIVEN,
        emergency_services_contacted: NOT_GIVEN,
        hospital_transport: NOT_GIVEN,
        hospital_name: NOT_GIVEN,
        physician_notified: NOT_GIVEN,
        family_notified: NOT_GIVEN,
        regulatory_report_required: NOT_GIVEN,
        follow_up_required: NOT_GIVEN,
        follow_up_due_at: NOT_GIVEN,
        follow_up_notes: NOT_GIVEN,
        resolved: NOT_GIVEN,
        resolution_notes: NOT_GIVEN,
        is_confidential: NOT_GIVEN,
        request_options: nil
      )
        _body = {
          "title" => title
        }
        _body["description"] = description unless description.equal?(NOT_GIVEN)
        _body["incidentDateTime"] = Serialize.dump(incident_date_time) unless incident_date_time.equal?(NOT_GIVEN)
        _body["category"] = category unless category.equal?(NOT_GIVEN)
        _body["severity"] = severity unless severity.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["patientId"] = patient_id unless patient_id.equal?(NOT_GIVEN)
        _body["caregiverId"] = caregiver_id unless caregiver_id.equal?(NOT_GIVEN)
        _body["visitId"] = visit_id unless visit_id.equal?(NOT_GIVEN)
        _body["actionsTaken"] = actions_taken unless actions_taken.equal?(NOT_GIVEN)
        _body["injuryBodyPart"] = injury_body_part unless injury_body_part.equal?(NOT_GIVEN)
        _body["witnessName"] = witness_name unless witness_name.equal?(NOT_GIVEN)
        _body["emergencyServicesContacted"] = emergency_services_contacted unless emergency_services_contacted.equal?(NOT_GIVEN)
        _body["hospitalTransport"] = hospital_transport unless hospital_transport.equal?(NOT_GIVEN)
        _body["hospitalName"] = hospital_name unless hospital_name.equal?(NOT_GIVEN)
        _body["physicianNotified"] = physician_notified unless physician_notified.equal?(NOT_GIVEN)
        _body["familyNotified"] = family_notified unless family_notified.equal?(NOT_GIVEN)
        _body["regulatoryReportRequired"] = regulatory_report_required unless regulatory_report_required.equal?(NOT_GIVEN)
        _body["followUpRequired"] = follow_up_required unless follow_up_required.equal?(NOT_GIVEN)
        _body["followUpDueAt"] = Serialize.dump(follow_up_due_at) unless follow_up_due_at.equal?(NOT_GIVEN)
        _body["followUpNotes"] = follow_up_notes unless follow_up_notes.equal?(NOT_GIVEN)
        _body["resolved"] = resolved unless resolved.equal?(NOT_GIVEN)
        _body["resolutionNotes"] = resolution_notes unless resolution_notes.equal?(NOT_GIVEN)
        _body["isConfidential"] = is_confidential unless is_confidential.equal?(NOT_GIVEN)
        Models::Incident.from_hash(@client.request("POST", "/v1/incidents", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve an incident.
      #
      # Returns one incident by ID. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the incident.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Incident]
      def retrieve(id, request_options: nil)
        Models::Incident.from_hash(@client.request("GET", "/v1/incidents/#{esc(id)}", options: request_options))
      end

      # Update an incident.
      #
      # Changes the fields you send and returns the updated incident. Send `null` to clear an
      # optional field. Available to keys belonging to office staff and caregivers. With a
      # caregiver's or patient's key, a saved record that key cannot read back is answered with
      # only `object` and `id`. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the incident.
      # @param title [String, nil] Short summary.
      # @param description [String, nil] What happened.
      # @param incident_date_time [String, Time, Date, nil] When the incident happened.
      # @param category [String, nil] Kind of incident.
      # @param severity [String, nil] How serious it was.
      # @param status [String, nil] Where follow-up stands. New incidents start `Open`. Only keys
      #   belonging to office staff can set this.
      # @param patient_id [String, nil] The patient involved.
      # @param caregiver_id [String, nil] The caregiver involved.
      # @param visit_id [String, nil] The visit during which it happened.
      # @param actions_taken [String, nil] What was done at the time.
      # @param injury_body_part [String, nil] Body part injured, if any.
      # @param witness_name [String, nil] Witness, if any.
      # @param emergency_services_contacted [Boolean, nil] Whether 911 or other emergency services
      #   were called.
      # @param hospital_transport [Boolean, nil] Whether the patient went to hospital.
      # @param hospital_name [String, nil] Hospital, if transported.
      # @param physician_notified [Boolean, nil] Whether the patient's physician was told.
      # @param family_notified [Boolean, nil] Whether family was told.
      # @param regulatory_report_required [Boolean, nil] Whether the incident must be reported to
      #   a regulator.
      # @param follow_up_required [Boolean, nil] Whether follow-up is needed.
      # @param follow_up_due_at [String, Time, Date, nil] When follow-up is due. Only keys
      #   belonging to office staff can set this.
      # @param follow_up_notes [String, nil] Follow-up notes.
      # @param resolved [Boolean, nil] Whether the incident is resolved. Only keys belonging to
      #   office staff can set this.
      # @param resolution_notes [String, nil] How it was resolved. Only keys belonging to office
      #   staff can set this.
      # @param is_confidential [Boolean, nil] Whether only administrators can see it. Only keys
      #   belonging to office staff can set this.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Incident]
      def update(
        id,
        title: nil,
        description: NOT_GIVEN,
        incident_date_time: NOT_GIVEN,
        category: NOT_GIVEN,
        severity: NOT_GIVEN,
        status: NOT_GIVEN,
        patient_id: NOT_GIVEN,
        caregiver_id: NOT_GIVEN,
        visit_id: NOT_GIVEN,
        actions_taken: NOT_GIVEN,
        injury_body_part: NOT_GIVEN,
        witness_name: NOT_GIVEN,
        emergency_services_contacted: NOT_GIVEN,
        hospital_transport: NOT_GIVEN,
        hospital_name: NOT_GIVEN,
        physician_notified: NOT_GIVEN,
        family_notified: NOT_GIVEN,
        regulatory_report_required: NOT_GIVEN,
        follow_up_required: NOT_GIVEN,
        follow_up_due_at: NOT_GIVEN,
        follow_up_notes: NOT_GIVEN,
        resolved: NOT_GIVEN,
        resolution_notes: NOT_GIVEN,
        is_confidential: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["title"] = title unless title.nil?
        _body["description"] = description unless description.equal?(NOT_GIVEN)
        _body["incidentDateTime"] = Serialize.dump(incident_date_time) unless incident_date_time.equal?(NOT_GIVEN)
        _body["category"] = category unless category.equal?(NOT_GIVEN)
        _body["severity"] = severity unless severity.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["patientId"] = patient_id unless patient_id.equal?(NOT_GIVEN)
        _body["caregiverId"] = caregiver_id unless caregiver_id.equal?(NOT_GIVEN)
        _body["visitId"] = visit_id unless visit_id.equal?(NOT_GIVEN)
        _body["actionsTaken"] = actions_taken unless actions_taken.equal?(NOT_GIVEN)
        _body["injuryBodyPart"] = injury_body_part unless injury_body_part.equal?(NOT_GIVEN)
        _body["witnessName"] = witness_name unless witness_name.equal?(NOT_GIVEN)
        _body["emergencyServicesContacted"] = emergency_services_contacted unless emergency_services_contacted.equal?(NOT_GIVEN)
        _body["hospitalTransport"] = hospital_transport unless hospital_transport.equal?(NOT_GIVEN)
        _body["hospitalName"] = hospital_name unless hospital_name.equal?(NOT_GIVEN)
        _body["physicianNotified"] = physician_notified unless physician_notified.equal?(NOT_GIVEN)
        _body["familyNotified"] = family_notified unless family_notified.equal?(NOT_GIVEN)
        _body["regulatoryReportRequired"] = regulatory_report_required unless regulatory_report_required.equal?(NOT_GIVEN)
        _body["followUpRequired"] = follow_up_required unless follow_up_required.equal?(NOT_GIVEN)
        _body["followUpDueAt"] = Serialize.dump(follow_up_due_at) unless follow_up_due_at.equal?(NOT_GIVEN)
        _body["followUpNotes"] = follow_up_notes unless follow_up_notes.equal?(NOT_GIVEN)
        _body["resolved"] = resolved unless resolved.equal?(NOT_GIVEN)
        _body["resolutionNotes"] = resolution_notes unless resolution_notes.equal?(NOT_GIVEN)
        _body["isConfidential"] = is_confidential unless is_confidential.equal?(NOT_GIVEN)
        Models::Incident.from_hash(@client.request("PATCH", "/v1/incidents/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete an incident.
      #
      # Deletes an incident. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the incident.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::IncidentDeleted]
      def delete(id, request_options: nil)
        Models::IncidentDeleted.from_hash(@client.request("DELETE", "/v1/incidents/#{esc(id)}", options: request_options))
      end
    end

    # Events your agency documents about a patient, caregiver or visit, such as a complaint, a
    # compliment or an attendance issue.
    class Events < Resource
      # List events.
      #
      # Returns a page of events. Filters combine with AND. Use `next_cursor` to fetch the next
      # page. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param status [String, nil] Only return events with this follow-up status.
      # @param patient_id [String, nil] Only return events involving this patient.
      # @param caregiver_id [String, nil] Only return events involving this caregiver.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Event>]
      def list(
        status: nil,
        patient_id: nil,
        caregiver_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["status"] = status unless status.nil?
        _query["patient_id"] = patient_id unless patient_id.nil?
        _query["caregiver_id"] = caregiver_id unless caregiver_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/events", _query, Models::Event, request_options)
      end

      # Create an event.
      #
      # Creates an event and returns it. Send an `Idempotency-Key` header to make the request safe
      # to retry. Available to keys belonging to office staff. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param title [String] Short summary.
      # @param description [String, nil] What happened.
      # @param category [String, nil] Category, as named in your agency's event types.
      # @param severity [String, nil] How serious it was.
      # @param status [String, nil] Where follow-up stands.
      # @param occurred_at [String, Time, Date, nil] When it happened.
      # @param patient_id [String, nil] The patient involved.
      # @param caregiver_id [String, nil] The caregiver involved.
      # @param visit_id [String, nil] The visit involved.
      # @param point_value [Float, nil] Attendance points this event counts for, if your agency
      #   uses a points policy.
      # @param actions_taken [String, nil] What was done.
      # @param outcome [String, nil] Outcome.
      # @param follow_up_required [Boolean, nil] Whether follow-up is needed.
      # @param follow_up_due_at [String, Time, Date, nil] When follow-up is due.
      # @param follow_up_notes [String, nil] Follow-up notes.
      # @param resolution_notes [String, nil] How it was resolved.
      # @param is_confidential [Boolean, nil] Whether only administrators can see it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Event]
      def create(
        title:,
        description: NOT_GIVEN,
        category: NOT_GIVEN,
        severity: NOT_GIVEN,
        status: NOT_GIVEN,
        occurred_at: NOT_GIVEN,
        patient_id: NOT_GIVEN,
        caregiver_id: NOT_GIVEN,
        visit_id: NOT_GIVEN,
        point_value: NOT_GIVEN,
        actions_taken: NOT_GIVEN,
        outcome: NOT_GIVEN,
        follow_up_required: NOT_GIVEN,
        follow_up_due_at: NOT_GIVEN,
        follow_up_notes: NOT_GIVEN,
        resolution_notes: NOT_GIVEN,
        is_confidential: NOT_GIVEN,
        request_options: nil
      )
        _body = {
          "title" => title
        }
        _body["description"] = description unless description.equal?(NOT_GIVEN)
        _body["category"] = category unless category.equal?(NOT_GIVEN)
        _body["severity"] = severity unless severity.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["occurredAt"] = Serialize.dump(occurred_at) unless occurred_at.equal?(NOT_GIVEN)
        _body["patientId"] = patient_id unless patient_id.equal?(NOT_GIVEN)
        _body["caregiverId"] = caregiver_id unless caregiver_id.equal?(NOT_GIVEN)
        _body["visitId"] = visit_id unless visit_id.equal?(NOT_GIVEN)
        _body["pointValue"] = point_value unless point_value.equal?(NOT_GIVEN)
        _body["actionsTaken"] = actions_taken unless actions_taken.equal?(NOT_GIVEN)
        _body["outcome"] = outcome unless outcome.equal?(NOT_GIVEN)
        _body["followUpRequired"] = follow_up_required unless follow_up_required.equal?(NOT_GIVEN)
        _body["followUpDueAt"] = Serialize.dump(follow_up_due_at) unless follow_up_due_at.equal?(NOT_GIVEN)
        _body["followUpNotes"] = follow_up_notes unless follow_up_notes.equal?(NOT_GIVEN)
        _body["resolutionNotes"] = resolution_notes unless resolution_notes.equal?(NOT_GIVEN)
        _body["isConfidential"] = is_confidential unless is_confidential.equal?(NOT_GIVEN)
        Models::Event.from_hash(@client.request("POST", "/v1/events", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve an event.
      #
      # Returns one event by ID. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the event.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Event]
      def retrieve(id, request_options: nil)
        Models::Event.from_hash(@client.request("GET", "/v1/events/#{esc(id)}", options: request_options))
      end

      # Update an event.
      #
      # Changes the fields you send and returns the updated event. Send `null` to clear an
      # optional field. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the event.
      # @param title [String, nil] Short summary.
      # @param description [String, nil] What happened.
      # @param category [String, nil] Category, as named in your agency's event types.
      # @param severity [String, nil] How serious it was.
      # @param status [String, nil] Where follow-up stands.
      # @param occurred_at [String, Time, Date, nil] When it happened.
      # @param patient_id [String, nil] The patient involved.
      # @param caregiver_id [String, nil] The caregiver involved.
      # @param visit_id [String, nil] The visit involved.
      # @param point_value [Float, nil] Attendance points this event counts for, if your agency
      #   uses a points policy.
      # @param actions_taken [String, nil] What was done.
      # @param outcome [String, nil] Outcome.
      # @param follow_up_required [Boolean, nil] Whether follow-up is needed.
      # @param follow_up_due_at [String, Time, Date, nil] When follow-up is due.
      # @param follow_up_notes [String, nil] Follow-up notes.
      # @param resolution_notes [String, nil] How it was resolved.
      # @param is_confidential [Boolean, nil] Whether only administrators can see it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Event]
      def update(
        id,
        title: nil,
        description: NOT_GIVEN,
        category: NOT_GIVEN,
        severity: NOT_GIVEN,
        status: NOT_GIVEN,
        occurred_at: NOT_GIVEN,
        patient_id: NOT_GIVEN,
        caregiver_id: NOT_GIVEN,
        visit_id: NOT_GIVEN,
        point_value: NOT_GIVEN,
        actions_taken: NOT_GIVEN,
        outcome: NOT_GIVEN,
        follow_up_required: NOT_GIVEN,
        follow_up_due_at: NOT_GIVEN,
        follow_up_notes: NOT_GIVEN,
        resolution_notes: NOT_GIVEN,
        is_confidential: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["title"] = title unless title.nil?
        _body["description"] = description unless description.equal?(NOT_GIVEN)
        _body["category"] = category unless category.equal?(NOT_GIVEN)
        _body["severity"] = severity unless severity.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["occurredAt"] = Serialize.dump(occurred_at) unless occurred_at.equal?(NOT_GIVEN)
        _body["patientId"] = patient_id unless patient_id.equal?(NOT_GIVEN)
        _body["caregiverId"] = caregiver_id unless caregiver_id.equal?(NOT_GIVEN)
        _body["visitId"] = visit_id unless visit_id.equal?(NOT_GIVEN)
        _body["pointValue"] = point_value unless point_value.equal?(NOT_GIVEN)
        _body["actionsTaken"] = actions_taken unless actions_taken.equal?(NOT_GIVEN)
        _body["outcome"] = outcome unless outcome.equal?(NOT_GIVEN)
        _body["followUpRequired"] = follow_up_required unless follow_up_required.equal?(NOT_GIVEN)
        _body["followUpDueAt"] = Serialize.dump(follow_up_due_at) unless follow_up_due_at.equal?(NOT_GIVEN)
        _body["followUpNotes"] = follow_up_notes unless follow_up_notes.equal?(NOT_GIVEN)
        _body["resolutionNotes"] = resolution_notes unless resolution_notes.equal?(NOT_GIVEN)
        _body["isConfidential"] = is_confidential unless is_confidential.equal?(NOT_GIVEN)
        Models::Event.from_hash(@client.request("PATCH", "/v1/events/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete an event.
      #
      # Deletes an event. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the event.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::EventDeleted]
      def delete(id, request_options: nil)
        Models::EventDeleted.from_hash(@client.request("DELETE", "/v1/events/#{esc(id)}", options: request_options))
      end
    end

    # Hospitals, physicians, case managers and other organizations that refer clients to your
    # agency.
    class ReferralSources < Resource
      # List referral sources.
      #
      # Returns a page of referral sources. Filters combine with AND. Use `next_cursor` to fetch
      # the next page. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param is_active [Boolean, nil] Only return active (`true`) or inactive (`false`) sources.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::ReferralSource>]
      def list(
        is_active: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["is_active"] = is_active unless is_active.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/referral-sources", _query, Models::ReferralSource, request_options)
      end

      # Create a referral source.
      #
      # Creates a referral source and returns it. Send an `Idempotency-Key` header to make the
      # request safe to retry. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param name [String] Name of the source.
      # @param type [String, nil] Kind of source, such as Hospital or Physician.
      # @param organization [String, nil] Organization the contact works for.
      # @param contact_name [String, nil] Main contact.
      # @param contact_title [String, nil] Contact's job title.
      # @param contact_phone [String, nil] Contact's phone number.
      # @param contact_email [String, nil] Contact's email address.
      # @param address [String, nil] Street address.
      # @param city [String, nil] City.
      # @param state [String, nil] State, as a two-letter code.
      # @param zip_code [String, nil] ZIP code.
      # @param notes [String, nil] Notes.
      # @param is_active [Boolean, nil] Whether you still receive referrals from this source.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::ReferralSource]
      def create(
        name:,
        type: NOT_GIVEN,
        organization: NOT_GIVEN,
        contact_name: NOT_GIVEN,
        contact_title: NOT_GIVEN,
        contact_phone: NOT_GIVEN,
        contact_email: NOT_GIVEN,
        address: NOT_GIVEN,
        city: NOT_GIVEN,
        state: NOT_GIVEN,
        zip_code: NOT_GIVEN,
        notes: NOT_GIVEN,
        is_active: NOT_GIVEN,
        request_options: nil
      )
        _body = {
          "name" => name
        }
        _body["type"] = type unless type.equal?(NOT_GIVEN)
        _body["organization"] = organization unless organization.equal?(NOT_GIVEN)
        _body["contactName"] = contact_name unless contact_name.equal?(NOT_GIVEN)
        _body["contactTitle"] = contact_title unless contact_title.equal?(NOT_GIVEN)
        _body["contactPhone"] = contact_phone unless contact_phone.equal?(NOT_GIVEN)
        _body["contactEmail"] = contact_email unless contact_email.equal?(NOT_GIVEN)
        _body["address"] = address unless address.equal?(NOT_GIVEN)
        _body["city"] = city unless city.equal?(NOT_GIVEN)
        _body["state"] = state unless state.equal?(NOT_GIVEN)
        _body["zipCode"] = zip_code unless zip_code.equal?(NOT_GIVEN)
        _body["notes"] = notes unless notes.equal?(NOT_GIVEN)
        _body["isActive"] = is_active unless is_active.equal?(NOT_GIVEN)
        Models::ReferralSource.from_hash(@client.request("POST", "/v1/referral-sources", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a referral source.
      #
      # Returns one referral source by ID. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the referral source.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::ReferralSource]
      def retrieve(id, request_options: nil)
        Models::ReferralSource.from_hash(@client.request("GET", "/v1/referral-sources/#{esc(id)}", options: request_options))
      end

      # Update a referral source.
      #
      # Changes the fields you send and returns the updated referral source. Send `null` to clear
      # an optional field. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the referral source.
      # @param name [String, nil] Name of the source.
      # @param type [String, nil] Kind of source, such as Hospital or Physician.
      # @param organization [String, nil] Organization the contact works for.
      # @param contact_name [String, nil] Main contact.
      # @param contact_title [String, nil] Contact's job title.
      # @param contact_phone [String, nil] Contact's phone number.
      # @param contact_email [String, nil] Contact's email address.
      # @param address [String, nil] Street address.
      # @param city [String, nil] City.
      # @param state [String, nil] State, as a two-letter code.
      # @param zip_code [String, nil] ZIP code.
      # @param notes [String, nil] Notes.
      # @param is_active [Boolean, nil] Whether you still receive referrals from this source.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::ReferralSource]
      def update(
        id,
        name: nil,
        type: NOT_GIVEN,
        organization: NOT_GIVEN,
        contact_name: NOT_GIVEN,
        contact_title: NOT_GIVEN,
        contact_phone: NOT_GIVEN,
        contact_email: NOT_GIVEN,
        address: NOT_GIVEN,
        city: NOT_GIVEN,
        state: NOT_GIVEN,
        zip_code: NOT_GIVEN,
        notes: NOT_GIVEN,
        is_active: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["name"] = name unless name.nil?
        _body["type"] = type unless type.equal?(NOT_GIVEN)
        _body["organization"] = organization unless organization.equal?(NOT_GIVEN)
        _body["contactName"] = contact_name unless contact_name.equal?(NOT_GIVEN)
        _body["contactTitle"] = contact_title unless contact_title.equal?(NOT_GIVEN)
        _body["contactPhone"] = contact_phone unless contact_phone.equal?(NOT_GIVEN)
        _body["contactEmail"] = contact_email unless contact_email.equal?(NOT_GIVEN)
        _body["address"] = address unless address.equal?(NOT_GIVEN)
        _body["city"] = city unless city.equal?(NOT_GIVEN)
        _body["state"] = state unless state.equal?(NOT_GIVEN)
        _body["zipCode"] = zip_code unless zip_code.equal?(NOT_GIVEN)
        _body["notes"] = notes unless notes.equal?(NOT_GIVEN)
        _body["isActive"] = is_active unless is_active.equal?(NOT_GIVEN)
        Models::ReferralSource.from_hash(@client.request("PATCH", "/v1/referral-sources/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete a referral source.
      #
      # Deletes a referral source. Available to keys belonging to office staff. Requires a key
      # with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the referral source.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::ReferralSourceDeleted]
      def delete(id, request_options: nil)
        Models::ReferralSourceDeleted.from_hash(@client.request("DELETE", "/v1/referral-sources/#{esc(id)}", options: request_options))
      end
    end

    # Individual referrals of a prospective client, tracked from first contact to admission.
    class Referrals < Resource
      # List referrals.
      #
      # Returns a page of referrals. Filters combine with AND. Use `next_cursor` to fetch the next
      # page. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param status [String, nil] Only return referrals with this status.
      # @param referral_source_id [String, nil] Only return referrals from this source.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Referral>]
      def list(
        status: nil,
        referral_source_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["status"] = status unless status.nil?
        _query["referral_source_id"] = referral_source_id unless referral_source_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/referrals", _query, Models::Referral, request_options)
      end

      # Create a referral.
      #
      # Creates a referral and returns it. Send an `Idempotency-Key` header to make the request
      # safe to retry. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param referral_source_id [String, nil] Who made the referral.
      # @param patient_id [String, nil] The patient record, once one exists.
      # @param patient_name [String] Name of the person referred.
      # @param contact_phone [String, nil] Phone number to reach the person or their family.
      # @param contact_email [String, nil] Email address to reach the person or their family.
      # @param referral_date [String, Time, Date, nil] When the referral arrived.
      # @param status [String, nil] Where the referral stands.
      # @param estimated_care_needs [String, nil] Care the person is expected to need.
      # @param estimated_weekly_hours [Float, nil] Expected hours of care per week.
      # @param urgency_level [String, nil] How soon care is needed.
      # @param decline_reason [String, nil] Why the referral was declined or lost.
      # @param notes [String, nil] Notes.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Referral]
      def create(
        patient_name:,
        referral_source_id: NOT_GIVEN,
        patient_id: NOT_GIVEN,
        contact_phone: NOT_GIVEN,
        contact_email: NOT_GIVEN,
        referral_date: NOT_GIVEN,
        status: NOT_GIVEN,
        estimated_care_needs: NOT_GIVEN,
        estimated_weekly_hours: NOT_GIVEN,
        urgency_level: NOT_GIVEN,
        decline_reason: NOT_GIVEN,
        notes: NOT_GIVEN,
        request_options: nil
      )
        _body = {
          "patientName" => patient_name
        }
        _body["referralSourceId"] = referral_source_id unless referral_source_id.equal?(NOT_GIVEN)
        _body["patientId"] = patient_id unless patient_id.equal?(NOT_GIVEN)
        _body["contactPhone"] = contact_phone unless contact_phone.equal?(NOT_GIVEN)
        _body["contactEmail"] = contact_email unless contact_email.equal?(NOT_GIVEN)
        _body["referralDate"] = Serialize.dump(referral_date) unless referral_date.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["estimatedCareNeeds"] = estimated_care_needs unless estimated_care_needs.equal?(NOT_GIVEN)
        _body["estimatedWeeklyHours"] = estimated_weekly_hours unless estimated_weekly_hours.equal?(NOT_GIVEN)
        _body["urgencyLevel"] = urgency_level unless urgency_level.equal?(NOT_GIVEN)
        _body["declineReason"] = decline_reason unless decline_reason.equal?(NOT_GIVEN)
        _body["notes"] = notes unless notes.equal?(NOT_GIVEN)
        Models::Referral.from_hash(@client.request("POST", "/v1/referrals", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a referral.
      #
      # Returns one referral by ID. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the referral.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Referral]
      def retrieve(id, request_options: nil)
        Models::Referral.from_hash(@client.request("GET", "/v1/referrals/#{esc(id)}", options: request_options))
      end

      # Update a referral.
      #
      # Changes the fields you send and returns the updated referral. Send `null` to clear an
      # optional field. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the referral.
      # @param referral_source_id [String, nil] Who made the referral.
      # @param patient_id [String, nil] The patient record, once one exists.
      # @param patient_name [String, nil] Name of the person referred.
      # @param contact_phone [String, nil] Phone number to reach the person or their family.
      # @param contact_email [String, nil] Email address to reach the person or their family.
      # @param referral_date [String, Time, Date, nil] When the referral arrived.
      # @param status [String, nil] Where the referral stands.
      # @param estimated_care_needs [String, nil] Care the person is expected to need.
      # @param estimated_weekly_hours [Float, nil] Expected hours of care per week.
      # @param urgency_level [String, nil] How soon care is needed.
      # @param decline_reason [String, nil] Why the referral was declined or lost.
      # @param notes [String, nil] Notes.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Referral]
      def update(
        id,
        referral_source_id: NOT_GIVEN,
        patient_id: NOT_GIVEN,
        patient_name: nil,
        contact_phone: NOT_GIVEN,
        contact_email: NOT_GIVEN,
        referral_date: NOT_GIVEN,
        status: NOT_GIVEN,
        estimated_care_needs: NOT_GIVEN,
        estimated_weekly_hours: NOT_GIVEN,
        urgency_level: NOT_GIVEN,
        decline_reason: NOT_GIVEN,
        notes: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["referralSourceId"] = referral_source_id unless referral_source_id.equal?(NOT_GIVEN)
        _body["patientId"] = patient_id unless patient_id.equal?(NOT_GIVEN)
        _body["patientName"] = patient_name unless patient_name.nil?
        _body["contactPhone"] = contact_phone unless contact_phone.equal?(NOT_GIVEN)
        _body["contactEmail"] = contact_email unless contact_email.equal?(NOT_GIVEN)
        _body["referralDate"] = Serialize.dump(referral_date) unless referral_date.equal?(NOT_GIVEN)
        _body["status"] = status unless status.equal?(NOT_GIVEN)
        _body["estimatedCareNeeds"] = estimated_care_needs unless estimated_care_needs.equal?(NOT_GIVEN)
        _body["estimatedWeeklyHours"] = estimated_weekly_hours unless estimated_weekly_hours.equal?(NOT_GIVEN)
        _body["urgencyLevel"] = urgency_level unless urgency_level.equal?(NOT_GIVEN)
        _body["declineReason"] = decline_reason unless decline_reason.equal?(NOT_GIVEN)
        _body["notes"] = notes unless notes.equal?(NOT_GIVEN)
        Models::Referral.from_hash(@client.request("PATCH", "/v1/referrals/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete a referral.
      #
      # Deletes a referral. Available to keys belonging to office staff. Requires a key with
      # `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the referral.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::ReferralDeleted]
      def delete(id, request_options: nil)
        Models::ReferralDeleted.from_hash(@client.request("DELETE", "/v1/referrals/#{esc(id)}", options: request_options))
      end
    end

    # Invoices billed to patients and their families for private-pay care. Read-only.
    class Invoices < Resource
      # List invoices.
      #
      # Returns a page of invoices. Filters combine with AND. Use `next_cursor` to fetch the next
      # page. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param patient_id [String, nil] Only return invoices for this patient.
      # @param status [String, nil] Only return invoices with this status.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Invoice>]
      def list(
        patient_id: nil,
        status: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["patient_id"] = patient_id unless patient_id.nil?
        _query["status"] = status unless status.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/invoices", _query, Models::Invoice, request_options)
      end

      # Retrieve an invoice.
      #
      # Returns one invoice by ID. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the invoice.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Invoice]
      def retrieve(id, request_options: nil)
        Models::Invoice.from_hash(@client.request("GET", "/v1/invoices/#{esc(id)}", options: request_options))
      end
    end

    # The individual charges on an invoice. Read-only.
    class InvoiceLineItems < Resource
      # List invoice line items.
      #
      # Returns a page of invoice line items. Filters combine with AND. Use `next_cursor` to fetch
      # the next page. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param invoice_id [String, nil] Only return lines of this invoice.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::InvoiceLineItem>]
      def list(
        invoice_id: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["invoice_id"] = invoice_id unless invoice_id.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/invoice-line-items", _query, Models::InvoiceLineItem, request_options)
      end

      # Retrieve an invoice line item.
      #
      # Returns one invoice line item by ID. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the invoice line item.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::InvoiceLineItem]
      def retrieve(id, request_options: nil)
        Models::InvoiceLineItem.from_hash(@client.request("GET", "/v1/invoice-line-items/#{esc(id)}", options: request_options))
      end
    end

    # Insurance claims billed to Medicaid, Medicare and other payers, with their adjudication
    # status. Read-only.
    class Claims < Resource
      # List claims.
      #
      # Returns a page of claims. Filters combine with AND. Use `next_cursor` to fetch the next
      # page. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param patient_id [String, nil] Only return claims for this patient.
      # @param status [String, nil] Only return claims with this status.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Claim>]
      def list(
        patient_id: nil,
        status: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["patient_id"] = patient_id unless patient_id.nil?
        _query["status"] = status unless status.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/claims", _query, Models::Claim, request_options)
      end

      # Retrieve a claim.
      #
      # Returns one claim by ID. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the claim.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Claim]
      def retrieve(id, request_options: nil)
        Models::Claim.from_hash(@client.request("GET", "/v1/claims/#{esc(id)}", options: request_options))
      end
    end

    # One caregiver's hours and pay for one pay period. Read-only.
    class PayrollEntries < Resource
      # List payroll entries.
      #
      # Returns a page of payroll entries. Filters combine with AND. Use `next_cursor` to fetch
      # the next page. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param caregiver_id [String, nil] Only return entries for this caregiver.
      # @param status [String, nil] Only return entries with this status.
      # @param pay_period_start [String, Time, Date, nil] Only return entries for the pay period
      #   starting on this date.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::PayrollEntry>]
      def list(
        caregiver_id: nil,
        status: nil,
        pay_period_start: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["caregiver_id"] = caregiver_id unless caregiver_id.nil?
        _query["status"] = status unless status.nil?
        _query["pay_period_start"] = pay_period_start unless pay_period_start.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/payroll-entries", _query, Models::PayrollEntry, request_options)
      end

      # Retrieve a payroll entry.
      #
      # Returns one payroll entry by ID. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the payroll entry.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::PayrollEntry]
      def retrieve(id, request_options: nil)
        Models::PayrollEntry.from_hash(@client.request("GET", "/v1/payroll-entries/#{esc(id)}", options: request_options))
      end
    end

    # In-app message threads between people at your agency: one-to-one chats and named group
    # chats. Read-only; start conversations in AveeCare.
    class Conversations < Resource
      # List conversations.
      #
      # Returns a page of conversations. Filters combine with AND. Use `next_cursor` to fetch the
      # next page.
      #
      # Requires the +read+ scope.
      #
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Conversation>]
      def list(
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/conversations", _query, Models::Conversation, request_options)
      end

      # Retrieve a conversation.
      #
      # Returns one conversation by ID.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the conversation.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Conversation]
      def retrieve(id, request_options: nil)
        Models::Conversation.from_hash(@client.request("GET", "/v1/conversations/#{esc(id)}", options: request_options))
      end
    end

    # Messages in a conversation. Messages you send through the API are sent as the API key's
    # user.
    class Messages < Resource
      # List messages.
      #
      # Returns a page of messages. Filters combine with AND. Use `next_cursor` to fetch the next
      # page.
      #
      # Requires the +read+ scope.
      #
      # @param conversation_id [String] The conversation to list messages from.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Message>]
      def list(
        conversation_id:,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["conversation_id"] = conversation_id
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/messages", _query, Models::Message, request_options)
      end

      # Create a message.
      #
      # Creates a message and returns it. Send an `Idempotency-Key` header to make the request
      # safe to retry. With a caregiver's or patient's key, a saved record that key cannot read
      # back is answered with only `object` and `id`. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param conversation_id [String] The conversation the message belongs to.
      # @param content [String] Message text.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Message]
      def create(conversation_id:, content:, request_options: nil)
        _body = {
          "conversationId" => conversation_id,
          "content" => content
        }
        Models::Message.from_hash(@client.request("POST", "/v1/messages", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve a message.
      #
      # Returns one message by ID.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the message.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Message]
      def retrieve(id, request_options: nil)
        Models::Message.from_hash(@client.request("GET", "/v1/messages/#{esc(id)}", options: request_options))
      end
    end

    # Alerts on your agency's alert board, such as a credential about to expire or a missed
    # clock-in, and announcements staff post for caregivers.
    class Alerts < Resource
      # List alerts.
      #
      # Returns a page of alerts. Filters combine with AND. Use `next_cursor` to fetch the next
      # page. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param type [String, nil] Only return alerts of this type.
      # @param audience [String, nil] Only return alerts for this audience.
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Alert>]
      def list(
        type: nil,
        audience: nil,
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["type"] = type unless type.nil?
        _query["audience"] = audience unless audience.nil?
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/alerts", _query, Models::Alert, request_options)
      end

      # Create an alert.
      #
      # Creates an alert and returns it. Send an `Idempotency-Key` header to make the request safe
      # to retry. Available to keys belonging to office staff. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param name [String] Headline.
      # @param description [String, nil] Details.
      # @param type [String, nil] How prominently the alert is shown.
      # @param audience [String, nil] Who sees the alert. `Caregiver`, `Patient`, `Visit` and
      #   `PatientCareTeam` need `audienceTargetId`.
      # @param audience_target_id [String, nil] The caregiver, patient or visit the alert is for,
      #   when the audience names one.
      # @param time [String, Time, Date, nil] When the alert takes effect.
      # @param review_date [String, Time, Date, nil] When the alert should be reviewed or cleared.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Alert]
      def create(
        name:,
        description: NOT_GIVEN,
        type: NOT_GIVEN,
        audience: NOT_GIVEN,
        audience_target_id: NOT_GIVEN,
        time: NOT_GIVEN,
        review_date: NOT_GIVEN,
        request_options: nil
      )
        _body = {
          "name" => name
        }
        _body["description"] = description unless description.equal?(NOT_GIVEN)
        _body["type"] = type unless type.equal?(NOT_GIVEN)
        _body["audience"] = audience unless audience.equal?(NOT_GIVEN)
        _body["audienceTargetId"] = audience_target_id unless audience_target_id.equal?(NOT_GIVEN)
        _body["time"] = Serialize.dump(time) unless time.equal?(NOT_GIVEN)
        _body["reviewDate"] = Serialize.dump(review_date) unless review_date.equal?(NOT_GIVEN)
        Models::Alert.from_hash(@client.request("POST", "/v1/alerts", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve an alert.
      #
      # Returns one alert by ID. Available to keys belonging to office staff and caregivers.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the alert.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Alert]
      def retrieve(id, request_options: nil)
        Models::Alert.from_hash(@client.request("GET", "/v1/alerts/#{esc(id)}", options: request_options))
      end

      # Update an alert.
      #
      # Changes the fields you send and returns the updated alert. Send `null` to clear an
      # optional field. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the alert.
      # @param name [String, nil] Headline.
      # @param description [String, nil] Details.
      # @param type [String, nil] How prominently the alert is shown.
      # @param audience [String, nil] Who sees the alert. `Caregiver`, `Patient`, `Visit` and
      #   `PatientCareTeam` need `audienceTargetId`.
      # @param audience_target_id [String, nil] The caregiver, patient or visit the alert is for,
      #   when the audience names one.
      # @param review_date [String, Time, Date, nil] When the alert should be reviewed or cleared.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Alert]
      def update(
        id,
        name: nil,
        description: NOT_GIVEN,
        type: NOT_GIVEN,
        audience: NOT_GIVEN,
        audience_target_id: NOT_GIVEN,
        review_date: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["name"] = name unless name.nil?
        _body["description"] = description unless description.equal?(NOT_GIVEN)
        _body["type"] = type unless type.equal?(NOT_GIVEN)
        _body["audience"] = audience unless audience.equal?(NOT_GIVEN)
        _body["audienceTargetId"] = audience_target_id unless audience_target_id.equal?(NOT_GIVEN)
        _body["reviewDate"] = Serialize.dump(review_date) unless review_date.equal?(NOT_GIVEN)
        Models::Alert.from_hash(@client.request("PATCH", "/v1/alerts/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete an alert.
      #
      # Deletes an alert. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the alert.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::AlertDeleted]
      def delete(id, request_options: nil)
        Models::AlertDeleted.from_hash(@client.request("DELETE", "/v1/alerts/#{esc(id)}", options: request_options))
      end
    end

    # Your agency's offices (branches). Patients, caregivers and applicants can each belong to one
    # office. There is always exactly one default office.
    class Offices < Resource
      # List offices.
      #
      # Returns a page of offices. Filters combine with AND. Use `next_cursor` to fetch the next
      # page. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param created_after [String, Time, Date, nil] Only return objects created after this time
      #   (exclusive). ISO 8601 with a time zone.
      # @param created_before [String, Time, Date, nil] Only return objects created before this
      #   time (exclusive). ISO 8601 with a time zone.
      # @param updated_after [String, Time, Date, nil] Only return objects last changed after this
      #   time (exclusive). ISO 8601 with a time zone. Use it for incremental sync: pass the newest
      #   `updatedAt` you already have.
      # @param updated_before [String, Time, Date, nil] Only return objects last changed before
      #   this time (exclusive). ISO 8601 with a time zone.
      # @param limit [Integer, nil] Number of objects to return, from 1 to 100.
      # @param cursor [String, nil] The `next_cursor` from the previous page. Send the same
      #   filters with it.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Page<Aveecare::Models::Office>]
      def list(
        created_after: nil,
        created_before: nil,
        updated_after: nil,
        updated_before: nil,
        limit: nil,
        cursor: nil,
        request_options: nil
      )
        _query = {}
        _query["created_after"] = created_after unless created_after.nil?
        _query["created_before"] = created_before unless created_before.nil?
        _query["updated_after"] = updated_after unless updated_after.nil?
        _query["updated_before"] = updated_before unless updated_before.nil?
        _query["limit"] = limit unless limit.nil?
        _query["cursor"] = cursor unless cursor.nil?
        @client.get_page("/v1/offices", _query, Models::Office, request_options)
      end

      # Create an office.
      #
      # Creates an office and returns it. Send an `Idempotency-Key` header to make the request
      # safe to retry. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param name [String] Office name.
      # @param address [String, nil] Street address.
      # @param city [String, nil] City.
      # @param state [String, nil] State, as a two-letter code.
      # @param zip_code [String, nil] ZIP code.
      # @param phone [String, nil] Main phone number.
      # @param is_default [Boolean, nil] Whether this is the default office. Making another office
      #   the default clears this one.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Office]
      def create(
        name:,
        address: NOT_GIVEN,
        city: NOT_GIVEN,
        state: NOT_GIVEN,
        zip_code: NOT_GIVEN,
        phone: NOT_GIVEN,
        is_default: NOT_GIVEN,
        request_options: nil
      )
        _body = {
          "name" => name
        }
        _body["address"] = address unless address.equal?(NOT_GIVEN)
        _body["city"] = city unless city.equal?(NOT_GIVEN)
        _body["state"] = state unless state.equal?(NOT_GIVEN)
        _body["zipCode"] = zip_code unless zip_code.equal?(NOT_GIVEN)
        _body["phone"] = phone unless phone.equal?(NOT_GIVEN)
        _body["isDefault"] = is_default unless is_default.equal?(NOT_GIVEN)
        Models::Office.from_hash(@client.request("POST", "/v1/offices", body: _body, idempotent: true, options: request_options))
      end

      # Retrieve an office.
      #
      # Returns one office by ID. Available to keys belonging to office staff.
      #
      # Requires the +read+ scope.
      #
      # @param id [String] ID of the office.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Office]
      def retrieve(id, request_options: nil)
        Models::Office.from_hash(@client.request("GET", "/v1/offices/#{esc(id)}", options: request_options))
      end

      # Update an office.
      #
      # Changes the fields you send and returns the updated office. Send `null` to clear an
      # optional field. Available to keys belonging to office staff. Requires a key with `write`
      # scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the office.
      # @param name [String, nil] Office name.
      # @param address [String, nil] Street address.
      # @param city [String, nil] City.
      # @param state [String, nil] State, as a two-letter code.
      # @param zip_code [String, nil] ZIP code.
      # @param phone [String, nil] Main phone number.
      # @param is_default [Boolean, nil] Whether this is the default office. Making another office
      #   the default clears this one.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Office]
      def update(
        id,
        name: nil,
        address: NOT_GIVEN,
        city: NOT_GIVEN,
        state: NOT_GIVEN,
        zip_code: NOT_GIVEN,
        phone: NOT_GIVEN,
        is_default: NOT_GIVEN,
        request_options: nil
      )
        _body = {}
        _body["name"] = name unless name.nil?
        _body["address"] = address unless address.equal?(NOT_GIVEN)
        _body["city"] = city unless city.equal?(NOT_GIVEN)
        _body["state"] = state unless state.equal?(NOT_GIVEN)
        _body["zipCode"] = zip_code unless zip_code.equal?(NOT_GIVEN)
        _body["phone"] = phone unless phone.equal?(NOT_GIVEN)
        _body["isDefault"] = is_default unless is_default.equal?(NOT_GIVEN)
        Models::Office.from_hash(@client.request("PATCH", "/v1/offices/#{esc(id)}", body: _body, options: request_options))
      end

      # Delete an office.
      #
      # Deletes an office. The default office, and an agency's only office, cannot be deleted.
      # Available to keys belonging to office staff. Requires a key with `write` scope.
      #
      # Requires the +write+ scope.
      #
      # @param id [String] ID of the office.
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::OfficeDeleted]
      def delete(id, request_options: nil)
        Models::OfficeDeleted.from_hash(@client.request("DELETE", "/v1/offices/#{esc(id)}", options: request_options))
      end
    end

    # The API key making the request: its scopes, its user's role and its agency.
    class Me < Resource
      # Retrieve the current API key.
      #
      # Returns the API key making the request, its scopes, the role of the user it belongs to,
      # and its agency. Useful to check a key works.
      #
      # Requires the +read+ scope.
      #
      # @param request_options [Hash, nil] +:idempotency_key+, +:timeout+, +:max_retries+, +:headers+
      # @return [Aveecare::Models::Me]
      def retrieve(request_options: nil)
        Models::Me.from_hash(@client.request("GET", "/v1/me", options: request_options))
      end
    end
  end

  # The resource accessors of Client.
  # @api private
  module ResourceAccessors
    # Patients are the clients your agency provides care to, including prospective clients you
    # have not yet admitted.
    # @return [Aveecare::Resources::Patients]
    def patients
      @patients ||= Resources::Patients.new(self)
    end

    # Contacts are family members and other people connected to a patient, such as an emergency
    # contact.
    # @return [Aveecare::Resources::Contacts]
    def contacts
      @contacts ||= Resources::Contacts.new(self)
    end

    # Allergies recorded on a patient's profile.
    # @return [Aveecare::Resources::Allergies]
    def allergies
      @allergies ||= Resources::Allergies.new(self)
    end

    # Medications on a patient's medication list, with the schedule caregivers follow when they
    # give or assist with them.
    # @return [Aveecare::Resources::Medications]
    def medications
      @medications ||= Resources::Medications.new(self)
    end

    # Goals of care set for a patient, such as walking to the mailbox unaided.
    # @return [Aveecare::Resources::CareGoals]
    def care_goals
      @care_goals ||= Resources::CareGoals.new(self)
    end

    # Notes your staff and caregivers keep on a patient's profile.
    # @return [Aveecare::Resources::PatientNotes]
    def patient_notes
      @patient_notes ||= Resources::PatientNotes.new(self)
    end

    # The medication administration record (MAR): each dose a caregiver gave, or the reason it was
    # not given. Read-only.
    # @return [Aveecare::Resources::MedicationAdministrations]
    def medication_administrations
      @medication_administrations ||= Resources::MedicationAdministrations.new(self)
    end

    # OASIS assessments recorded for Medicare home health patients. This lists each assessment and
    # its status; the item-level answers are not included. Read-only.
    # @return [Aveecare::Resources::OasisAssessments]
    def oasis_assessments
      @oasis_assessments ||= Resources::OasisAssessments.new(self)
    end

    # Caregivers are the aides, nurses and therapists your agency schedules to visit patients.
    # @return [Aveecare::Resources::Caregivers]
    def caregivers
      @caregivers ||= Resources::Caregivers.new(self)
    end

    # Notes your staff keep on a caregiver's profile.
    # @return [Aveecare::Resources::CaregiverNotes]
    def caregiver_notes
      @caregiver_notes ||= Resources::CaregiverNotes.new(self)
    end

    # Certifications, licenses and background checks on a caregiver's profile, with their expiry
    # dates.
    # @return [Aveecare::Resources::Certifications]
    def certifications
      @certifications ||= Resources::Certifications.new(self)
    end

    # When a caregiver can or cannot work. A window is either a weekly recurring time on one
    # weekday, or a one-off date range such as time off.
    # @return [Aveecare::Resources::Availability]
    def availability
      @availability ||= Resources::Availability.new(self)
    end

    # Skills and specialties on a caregiver's profile, such as dementia care or Hoyer lift
    # transfers.
    # @return [Aveecare::Resources::Specializations]
    def specializations
      @specializations ||= Resources::Specializations.new(self)
    end

    # People who applied to work for your agency, tracked through your hiring stages until they
    # are hired as caregivers.
    # @return [Aveecare::Resources::Applicants]
    def applicants
      @applicants ||= Resources::Applicants.new(self)
    end

    # Visits are scheduled or completed caregiver shifts at a patient's home. A visit's patient,
    # caregiver, times and status are set when it is created; reschedule or reassign a visit in
    # AveeCare.
    # @return [Aveecare::Resources::Visits]
    def visits
      @visits ||= Resources::Visits.new(self)
    end

    # Notes written about a visit by the caregiver or office staff.
    # @return [Aveecare::Resources::VisitNotes]
    def visit_notes
      @visit_notes ||= Resources::VisitNotes.new(self)
    end

    # Requests from caregivers to pick up visits with a patient, which office staff approve or
    # deny.
    # @return [Aveecare::Resources::VisitRequests]
    def visit_requests
      @visit_requests ||= Resources::VisitRequests.new(self)
    end

    # Open shifts are unassigned visits offered to caregivers so one of them can claim it.
    # @return [Aveecare::Resources::OpenShifts]
    def open_shifts
      @open_shifts ||= Resources::OpenShifts.new(self)
    end

    # Requests from one caregiver to hand a visit to another, which the other caregiver and then
    # the office approve.
    # @return [Aveecare::Resources::ShiftSwaps]
    def shift_swaps
      @shift_swaps ||= Resources::ShiftSwaps.new(self)
    end

    # Care plans describe the services a patient receives, how often, and when the plan is next
    # reviewed. The plan's goals and task lists are managed in AveeCare and are not included here.
    # @return [Aveecare::Resources::CarePlans]
    def care_plans
      @care_plans ||= Resources::CarePlans.new(self)
    end

    # Progress notes are the clinical summaries caregivers write after a visit.
    # @return [Aveecare::Resources::ProgressNotes]
    def progress_notes
      @progress_notes ||= Resources::ProgressNotes.new(self)
    end

    # Payer authorizations: how many units of a service a payer has approved for a patient, and
    # over what dates.
    # @return [Aveecare::Resources::Authorizations]
    def authorizations
      @authorizations ||= Resources::Authorizations.new(self)
    end

    # Incident reports: falls, injuries, medication errors and other events that need follow-up,
    # often for regulatory reporting.
    # @return [Aveecare::Resources::Incidents]
    def incidents
      @incidents ||= Resources::Incidents.new(self)
    end

    # Events your agency documents about a patient, caregiver or visit, such as a complaint, a
    # compliment or an attendance issue.
    # @return [Aveecare::Resources::Events]
    def events
      @events ||= Resources::Events.new(self)
    end

    # Hospitals, physicians, case managers and other organizations that refer clients to your
    # agency.
    # @return [Aveecare::Resources::ReferralSources]
    def referral_sources
      @referral_sources ||= Resources::ReferralSources.new(self)
    end

    # Individual referrals of a prospective client, tracked from first contact to admission.
    # @return [Aveecare::Resources::Referrals]
    def referrals
      @referrals ||= Resources::Referrals.new(self)
    end

    # Invoices billed to patients and their families for private-pay care. Read-only.
    # @return [Aveecare::Resources::Invoices]
    def invoices
      @invoices ||= Resources::Invoices.new(self)
    end

    # The individual charges on an invoice. Read-only.
    # @return [Aveecare::Resources::InvoiceLineItems]
    def invoice_line_items
      @invoice_line_items ||= Resources::InvoiceLineItems.new(self)
    end

    # Insurance claims billed to Medicaid, Medicare and other payers, with their adjudication
    # status. Read-only.
    # @return [Aveecare::Resources::Claims]
    def claims
      @claims ||= Resources::Claims.new(self)
    end

    # One caregiver's hours and pay for one pay period. Read-only.
    # @return [Aveecare::Resources::PayrollEntries]
    def payroll_entries
      @payroll_entries ||= Resources::PayrollEntries.new(self)
    end

    # In-app message threads between people at your agency: one-to-one chats and named group
    # chats. Read-only; start conversations in AveeCare.
    # @return [Aveecare::Resources::Conversations]
    def conversations
      @conversations ||= Resources::Conversations.new(self)
    end

    # Messages in a conversation. Messages you send through the API are sent as the API key's
    # user.
    # @return [Aveecare::Resources::Messages]
    def messages
      @messages ||= Resources::Messages.new(self)
    end

    # Alerts on your agency's alert board, such as a credential about to expire or a missed
    # clock-in, and announcements staff post for caregivers.
    # @return [Aveecare::Resources::Alerts]
    def alerts
      @alerts ||= Resources::Alerts.new(self)
    end

    # Your agency's offices (branches). Patients, caregivers and applicants can each belong to one
    # office. There is always exactly one default office.
    # @return [Aveecare::Resources::Offices]
    def offices
      @offices ||= Resources::Offices.new(self)
    end

    # The API key making the request: its scopes, its user's role and its agency.
    # @return [Aveecare::Resources::Me]
    def me
      @me ||= Resources::Me.new(self)
    end
  end
end
