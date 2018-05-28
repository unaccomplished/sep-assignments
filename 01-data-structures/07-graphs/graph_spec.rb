include RSpec

require_relative 'graph'

RSpec.describe Graph, type: Class do
  let(:kevin_bacon) { Node.new("Kevin Bacon") }
  let(:lori_singer) { Node.new("Lori Singer") }
  let(:john_lithgow) { Node.new("John Lithgow") }
  let(:dianne_wiest) { Node.new("Dianne Wiest") }
  let(:chris_penn) { Node.new("Chris Penn") }
  let(:sarah_jessica_parker) { Node.new("Sarah Jessica Parker") }
  let(:johnny_depp) { Node.new("Johnny Depp") }
  let(:geoffrey_rush) { Node.new("Geoffrey Rush") }
  let(:liam_neeson) { Node.new("Liam Neeson") }
  let(:ralph_fiennes) { Node.new("Ralph Fiennes") }
  let(:gary_oldman) { Node.new("Gary Oldman") }
  let(:winona_ryder) { Node.new("Winona Ryder") }
  let(:kiera_knightley) { Node.new("Kiera Knightley") }
  let(:uma_thurman) { Node.new("Uma Thurman") }
  let(:ben_kingsley) { Node.new("Ben Kingsley") }
  let(:emma_watson) { Node.new("Emma Watson") }
  let(:dan_stevens) { Node.new("Dan Stevens") }
  let(:john_nobody) { Node.new("John Nobody") }

  let (:graph) { Graph.new }

  before do
    kevin_bacon.film_actor_hash["Footloose"] = [lori_singer, john_lithgow, dianne_wiest, chris_penn, sarah_jessica_parker]
    dianne_wiest.film_actor_hash["Footloose"] = [kevin_bacon, lori_singer, john_lithgow, chris_penn, sarah_jessica_parker]
    # dianne_wiest.film_actor_hash["Edward Scissorhands"] = [johnny_depp, winona_ryder]
    johnny_depp.film_actor_hash["Edward Scissorhands"] = [dianne_wiest, winona_ryder]
    # johnny_depp.film_actor_hash["Pirates of the Caribbean"] = [geoffrey_rush, kiera_knightley]
    geoffrey_rush.film_actor_hash["Pirates of the Caribbean"] = [johnny_depp, kiera_knightley]
    # geoffrey_rush.film_actor_hash["Les Miserables"] = [liam_neeson, uma_thurman]
    liam_neeson.film_actor_hash["Les Miserables"] = [geoffrey_rush, uma_thurman]
    # liam_neeson.film_actor_hash["Schindler's List"] = [ralph_fiennes, ben_kingsley]
    ralph_fiennes.film_actor_hash["Schindler's List"] = [liam_neeson, ben_kingsley]
    # ralph_fiennes.film_actor_hash["Harry Potter and the Goblet of Fire"] = [gary_oldman, emma_watson]
    gary_oldman.film_actor_hash["Harry Potter and the Goblet of Fire"] = [ralph_fiennes, emma_watson]
    emma_watson.film_actor_hash["Harry Potter and the Prisoner of Azkaban"] = [gary_oldman]
  end

  describe "#node" do
    it "returns name of node" do
      expect(kevin_bacon.name).to eq("Kevin Bacon")
    end

    it "returns hash properties" do
      expect(kevin_bacon.film_actor_hash["Footloose"][2].name).to eq("Dianne Wiest")
    end
  end

  describe "#find_kevin_bacon" do
    it "returns nil if there are no connections to Kevin Bacon" do
      expect(graph.find_kevin_bacon(john_nobody)).to eq []
    end

    it "returns a movie if there is one degree of connection to Kevin Bacon" do
      expect(graph.find_kevin_bacon(dianne_wiest)).to eq ["Footloose"]
    end

    it "returns an array of 2 movies if there is 2 degrees of connection to Kevin Bacon" do
      expect(graph.find_kevin_bacon(johnny_depp)).to eq ["Edward Scissorhands", "Footloose"]
    end

    it "returns an array of 3 movies if there is 3 degrees of connection to Kevin Bacon" do
      expect(graph.find_kevin_bacon(geoffrey_rush)).to eq ["Pirates of the Caribbean", "Edward Scissorhands", "Footloose"]
    end

    it "returns an array of 4 movies if there is 4 degrees of connection to Kevin Bacon" do
      expect(graph.find_kevin_bacon(liam_neeson)).to eq ["Les Miserables", "Pirates of the Caribbean", "Edward Scissorhands", "Footloose"]
    end

    it "returns an array of 5 movies if there is 5 degrees of connection to Kevin Bacon" do
      expect(graph.find_kevin_bacon(ralph_fiennes)).to eq ["Schindler's List", "Les Miserables", "Pirates of the Caribbean", "Edward Scissorhands", "Footloose"]
    end

    it "returns an array of 6 movies if there is 6 degrees of connection to Kevin Bacon" do
      expect(graph.find_kevin_bacon(gary_oldman)).to eq ["Harry Potter and the Goblet of Fire", "Schindler's List", "Les Miserables", "Pirates of the Caribbean", "Edward Scissorhands", "Footloose"]
    end

    it "returns an error message if there is more than 6 degrees of connection to Kevin Bacon" do
      expect(graph.find_kevin_bacon(emma_watson)).to eq("Emma Watson is not connected to Kevin Bacon within 6 degrees or less.")
    end
  end

end
