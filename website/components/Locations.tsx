import React from 'react'
interface LocationProps {
  backgroundImage: string;
  title: string;
  subtitle: string;
  peopleJoined: string;
}
const LocationCard =({ backgroundImage, title, subtitle, peopleJoined }: LocationProps)=>{

}
const Location = () => {
  return (
    <section className="2xl:max-container relative flex flex-col py-10 lg:mb-10 lg:py-20 xl:mb-20">
      <div className="hide-scrollbar flex h-[340px] w-full items-start justify-start gap-8 overflow-x-auto lg:h-[400px] xl:h-[640px]">
      <LocationCard 
          backgroundImage="bg-bg-img-1"
          title="Putuk Truno Camp"
          subtitle="Prigen, Pasuruan"
          peopleJoined="50+ Joined"
        />
        <LocationCard 
          backgroundImage="bg-bg-img-2"
          title="Mountain View Camp"
          subtitle="Somewhere in the Wilderness"
          peopleJoined="50+ Joined"
        />
      </div>
    </section>
  )
}

export default Location