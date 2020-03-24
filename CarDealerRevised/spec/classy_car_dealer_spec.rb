require_relative './setup'

RSpec.describe MainApp do
    context "with model E" do
        it "should allow us to get menu selection input from user" do
            output, _app = select_options("1", "e", "6", last_lines_count: 10)

            expect(output).to eq <<~OUTPUT
                Model: E
                Selected Options: (None)
                Total Price: $10000
                1. Select a model (E, L, X)
                2. Display available options and prices
                3. Add an option
                4. Remove an option
                5. Cancel order
                6. Quit
                Enter choice: 
            OUTPUT
        end

        it "should allow us to get menu selection input from user" do
            _output, app = select_options("1", "e", "6")
            user_package = app.user_package

            expect(user_package.model_info.id).to eq("E")
            expect(user_package.model_info.price).to eq(10_000)
        end
    end

    def select_options(*entries, last_lines_count: nil)
        transformed_entries = entries.join("\n") + "\n"
        input = FakeIO.new(transformed_entries)
        output = FakeIO.new

        app = MainApp.new(input: input, output: output)
        app.run

        last_lines_count ||= output.string.length
        transformed_ouput = output.string.split("\n").last(last_lines_count).join("\n") + "\n"

        [transformed_ouput, app]
    end
end