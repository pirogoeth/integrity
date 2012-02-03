module Integrity
  class PayloadBuilder
    def self.build(payload, build_all)
      Integrity.logger.info("instantiated for new build requested with payload: #{payload}")
      new(payload, build_all).build
    end

    def initialize(payload, build_all)
      @payload   = payload
      @build_all = build_all
      Integrity.logger.info("new payloadbuilder (#{self}) initialised for #{payload}") 
    end

    def build
      Integrity.logger.info("Started build method checking.")
      if Integrity.config.trim_branches? && @payload.deleted?
        Integrity.logger.info("Project trimming / destruction active.")
        projects.each { |project| project.destroy }
      else
        Integrity.logger.info("Building projects.")
        builds.each { |build| build.run! }.size
      end
      Integrity.logger.error("No build step was reached toward build of the payload, attempting to build anyway.");
      builds.each { |build| build.run! }.size
    end

    def builds
      @builds ||=
        projects.inject([]) { |acc, project|
          acc.concat commits.map { |c| project.builds.create(:commit => c) }
        }
    end

    def commits
      @commits ||= @build_all ? @payload.commits : [@payload.head]
    end

    def projects
      @projects ||= ProjectFinder.find(@payload.repo)
    end
  end
end
