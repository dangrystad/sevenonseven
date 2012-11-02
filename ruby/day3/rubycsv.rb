module ActAsCsv
    def self.included(base)
        base.extend ClassMethods
    end
    
    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end
    
    module InstanceMethods
        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')
            
            file.each do |row|
                @csv_contents << CsvRow.new(@headers,row.chomp.split(', '))
            end
        end
        
        attr_accessor :headers, :csv_contents
        def initialize
            read
        end
        
        def each(&blk)
            @csv_contents.each(&blk)
        end
    end
    
    class CsvRow
         def initialize(headers=[],row=[])
            @headers = headers;
            @row_contents = row
        end
        
        def method_missing name, *args
            index = @headers.index(name.to_s)
            if index
                @row_contents[index]
            end
        end
    end
    
end


class RubyCsv
    include ActAsCsv
    acts_as_csv
end

m = RubyCsv.new
m.each{ |row| puts row.one }
