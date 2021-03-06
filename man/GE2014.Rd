% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/misc_doc.R
\docType{data}
\name{GE2014}
\alias{GE2014}
\title{General Election Results 2014}
\format{A data frame with 136,195 rows and 7 variables.}
\source{
\url{http://www.electionresults.govt.nz/electionresults_2014/e9/html/statistics.html}
}
\usage{
GE2014
}
\description{
New Zealand 2014 general election results by voting place
}
\details{
\itemize{
  \item \code{ApproxLocation}. Approximate location of voting place
  \item \code{VotingPlace}. Exact location of voting place
  \item \code{Party}. Party voted for (party vote) or party of candidate voted for
  (candidate vote)
  \item \code{Votes}. Number of votes
  \item \code{Electorate}. Electorate in which voters were enrolled.  Note that this 
  is not necessarily the physical location of the VotingPlace, so VotingPlace
  and Electorate have a many to many relationship
  \item \code{VotingType}. Party (proportional representation) or Candidate (first past 
  the vote).  In New Zealand each voter has to vote for both an individual
  candidate to represent their electorate, and a party vote for the overall makeup
  of Parliament.
  \item \code{Candidate}. If VotingType == "Candidate", the name of the candidate; 
  otherwise NA
}
\code{GE2014} is deprecated; please use \code{nzge} instead - it has results back to 2002 and is the one we 
will update in future.
}
\examples{
# the following matches the results published at
# http://www.electionresults.govt.nz/electionresults_2014/e9/html/e9_part1.html
library(tidyr)
library(dplyr)
GE2014 \%>\%
    mutate(VotingType = paste0(VotingType, "Vote")) \%>\%
    group_by(Party, VotingType) \%>\%
    summarise(Votes = sum(Votes)) \%>\%
    spread(VotingType, Votes) \%>\%
    select(Party, PartyVote, CandidateVote) \%>\%
    ungroup() \%>\%
    arrange(desc(PartyVote))
}
\seealso{
\code{\link{Locations2014}}
}
\keyword{datasets}
