require_relative './setup'

RSpec.describe MainApp do
    context "with model E" do
        let(:output) { @output }
        
        it "Should allow user to select a model" do
            select_menu_options("1", "e", "6")

            expect(output).to include("Model: E")
            expect(output).to include("Selected Options: (None)")
            expect(output).to include("Total Price: $10000")
            expect(output).to include(standard_menu)
        end
        
        it "Should allow user to display available options and prices" do
            select_menu_options("1", "e", "2", "6", last_lines_count: 20)

            expect(output).to include(CarOptionList.available_options.to_s("\n"))
        end

        it "Should allow user to add an option to their package" do
            select_menu_options("1", "e", "2", "3", "carplay", "6")

            expect(output).to include("Model: E")
            expect(output).to include("CarPlay ($500)")
            expect(output).to include("Total Price: $10500")
            expect(output).to include(standard_menu)
        end

        it "Should allow user to remove an added option from their package" do
            select_menu_options("1", "e", "2", "3", "carplay", "4", "carplay", "6")

            expect(output).to include("Model: E")
            expect(output).to include("(None)")
            expect(output).to include("Total Price: $10000")
            expect(output).to include(standard_menu)
        end

        it "Should allow user to cancel order" do
            select_menu_options("1", "e", "2", "3", "carplay", "5", "6")

            expect(output).to include("NO MODEL SELECTED")
            expect(output).to include(standard_menu)
        end
    end

    def select_menu_options(*opts, last_lines_count: 10)
        @output = run_app_and_get_output(*opts, last_lines_count: last_lines_count)
    end

    def run_app_and_get_output(*entries, last_lines_count: nil)
        transformed_entries = entries.join("\n") + "\n"
        input = FakeIO.new(transformed_entries)
        output = FakeIO.new

        app = MainApp.new(input: input, output: output)
        app.run

        last_lines_count ||= output.string.length
        
        output.string.split("\n").last(last_lines_count).join("\n") + "\n"
    end

    def standard_menu
        <<~OUTPUT
            1. Select a model (E, L, X)
            2. Display available options and prices
            3. Add an option
            4. Remove an option
            5. Cancel order
            6. Quit
            Enter choice: 
        OUTPUT
    end
end