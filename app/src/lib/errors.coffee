#This file is part of S2 and is distributed under the terms of GNU General Public License version 1 or later;
#Please refer to the LICENSE and README files for information on licensing and authorship of this file.
#Copyright (C) 2014 Genome Research Ltd.
define ["config"], (Config) ->

  errors =
    sample:
      mandatoryFieldsError: "Sample must contain the fields: #{Config.sample.mandatoryFields.join(", ")}"
      validStatesError: "STATE is not valid. STATE must be one of the following: #{Config.sample.validStates.join(", ")}"
      mandatoryIfStateIsPublishedError: "If STATE is PUBLISHED, sample must be one of the following: #{Config.sample.mandatoryIfStateIsPublished.join(", ")}"
      validSampleTypesError: "SAMPLE_TYPE must be one of #{Config.sample.validSampleTypes.join(", ")}"
      validGendersError: "GENDER must be one of the following: #{Config.sample.validGenders.join(", ")}"
